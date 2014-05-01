//
//  UIFont+YSUIKitAdditions.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/04/30.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "UIFont+YSUIKitAdditions.h"
@import CoreText;

#if DEBUG
    #if 1
        #define LOG_UIFont(...) NSLog(__VA_ARGS__)
    #endif
#endif

#ifndef LOG_UIFont
    #define LOG_UIFont(...)
#endif

NSString *NSStringFromUIFontDescriptorSymbolicTraits(UIFontDescriptorSymbolicTraits symbol)
{
    NSMutableString *description = @"{\n".mutableCopy;
    
    NSArray *definedTraits = @[@(UIFontDescriptorTraitItalic), // = 1u << 0,
                               @(UIFontDescriptorTraitBold), // = 1u << 1,
                               @(UIFontDescriptorTraitExpanded), // = 1u << 5,
                               @(UIFontDescriptorTraitCondensed), // = 1u << 6,
                               @(UIFontDescriptorTraitMonoSpace), // = 1u << 10,
                               @(UIFontDescriptorTraitVertical), // = 1u << 11,
                               @(UIFontDescriptorTraitUIOptimized), // = 1u << 12,
                               @(UIFontDescriptorTraitTightLeading), // = 1u << 15,
                               @(UIFontDescriptorTraitLooseLeading)]; // = 1u << 16,
                               
    for (NSNumber *traitsNum in definedTraits) {
        UIFontDescriptorSymbolicTraits trait = traitsNum.unsignedIntValue;
        if (symbol & trait) {
            NSString *addStr;
            switch (trait) {
                case UIFontDescriptorTraitItalic: // = 1u << 0,
                    addStr = @"Italic";
                    break;
                case UIFontDescriptorTraitBold: // = 1u << 1,
                    addStr = @"Bold";
                    break;
                case UIFontDescriptorTraitExpanded: // = 1u << 5,
                    addStr = @"Expanded";
                    break;
                case UIFontDescriptorTraitCondensed: // = 1u << 6,
                    addStr = @"Condensed";
                    break;
                case UIFontDescriptorTraitMonoSpace: // = 1u << 10,
                    addStr = @"MonoSpace";
                    break;
                case UIFontDescriptorTraitVertical: // = 1u << 11,
                    addStr = @"Vertical";
                    break;
                case UIFontDescriptorTraitUIOptimized: // = 1u << 12,
                    addStr = @"UIOptimized";
                    break;
                case UIFontDescriptorTraitTightLeading: // = 1u << 15,
                    addStr = @"TightLeading";
                    break;
                case UIFontDescriptorTraitLooseLeading: // = 1u << 16,
                    addStr = @"LooseLeading";
                    break;
                default:
                    addStr = [NSString stringWithFormat:@"Unkwnon UIFontDescriptorSymbolicTraits: %@", @(trait)];
                    break;
            }
            [description appendFormat:@"    %@,\n", addStr];
        }
    }

    /* Font appearance info (upper 16 bits of UIFontDescriptorSymbolicTraits */
    // UIFontDescriptorClassMask = 0xF0000000,
    NSArray *definedClass = @[@(UIFontDescriptorClassUnknown), // = 0u << 28,
                              @(UIFontDescriptorClassOldStyleSerifs), // = 1u << 28,
                              @(UIFontDescriptorClassTransitionalSerifs), // = 2u << 28,
                              @(UIFontDescriptorClassModernSerifs), // = 3u << 28,
                              @(UIFontDescriptorClassClarendonSerifs), // = 4u << 28,
                              @(UIFontDescriptorClassSlabSerifs), // = 5u << 28,
                              @(UIFontDescriptorClassFreeformSerifs), // = 7u << 28,
                              @(UIFontDescriptorClassSansSerif), // = 8u << 28,
                              @(UIFontDescriptorClassOrnamentals), // = 9u << 28,
                              @(UIFontDescriptorClassScripts), // = 10u << 28,
                              @(UIFontDescriptorClassSymbolic)]; // = 12u << 28];
    
    for (NSNumber *classNum in definedClass) {
        UIFontDescriptorSymbolicTraits class = classNum.unsignedIntValue;
        if ((symbol & UIFontDescriptorClassMask) & class) {
            NSString *addStr;
            switch (class) {
                    /* Font appearance info (upper 16 bits of UIFontDescriptorSymbolicTraits */
                case UIFontDescriptorClassUnknown: // = 0u << 28,
                    addStr = @"Unknown";
                    break;
                case UIFontDescriptorClassOldStyleSerifs: // = 1u << 28,
                    addStr = @"OldStyleSerifs";
                    break;
                case UIFontDescriptorClassTransitionalSerifs: // = 2u << 28,
                    addStr = @"TransitionalSerifs";
                    break;
                case UIFontDescriptorClassModernSerifs: // = 3u << 28,
                    addStr = @"ModernSerifs";
                    break;
                case UIFontDescriptorClassClarendonSerifs: // = 4u << 28,
                    addStr = @"ClarendonSerifs";
                    break;
                case UIFontDescriptorClassSlabSerifs: // = 5u << 28,
                    addStr = @"SlabSerifs";
                    break;
                case UIFontDescriptorClassFreeformSerifs: // = 7u << 28,
                    addStr = @"FreeformSerifs";
                    break;
                case UIFontDescriptorClassSansSerif: // = 8u << 28,
                    addStr = @"SansSerif";
                    break;
                case UIFontDescriptorClassOrnamentals: // = 9u << 28,
                    addStr = @"Ornamentals";
                    break;
                case UIFontDescriptorClassScripts: // = 10u << 28,
                    addStr = @"Scripts";
                    break;
                case UIFontDescriptorClassSymbolic: // = 12u << 28
                    addStr = @"Symbolic";
                    break;
                default:
                    addStr = [NSString stringWithFormat:@"Unkwnon UIFontDescriptorSymbolicTraits: %@", @(class)];
                    break;
            }
            [description appendFormat:@"    %@,\n", addStr];
        }
    }
    
    [description appendString:@"}"];
    return [NSString stringWithString:description];
}

@implementation UIFont (YSUIKitAdditions)

#pragma mark - convert

- (UIFont *)ys_convertedNormalFont
{
    return [self ys_convertedFontWithBold:NO italic:NO];
}

- (UIFont *)ys_convertedBoldFont
{
    return [self ys_convertedFontWithBold:YES italic:NO];
}

- (UIFont *)ys_convertedItalicFont
{
    return [self ys_convertedFontWithBold:NO italic:YES];
}

- (UIFont *)ys_convertedBoldItalicFont
{
    return [self ys_convertedFontWithBold:YES italic:YES];
}

- (UIFont*)ys_convertedFontWithBold:(BOOL)convertedBold italic:(BOOL)convertedItalic
{
    if (!convertedBold && !convertedItalic) {
        return [self _ys_convertedNormalFont];
    }
    
    UIFontDescriptor *selfDescriptor = self.fontDescriptor;
    UIFontDescriptorSymbolicTraits existingTraits;
    if (convertedBold && convertedItalic) {
        existingTraits = UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic;
    } else if (convertedBold) {
        existingTraits = UIFontDescriptorTraitBold | (selfDescriptor.symbolicTraits & UIFontDescriptorTraitItalic);
    } else {
        existingTraits = UIFontDescriptorTraitItalic | (selfDescriptor.symbolicTraits & UIFontDescriptorTraitBold);
    }
    
    if ((selfDescriptor.symbolicTraits & existingTraits) == existingTraits) {
        LOG_UIFont(@"self: %@", self.fontName);
        return self;
    }
    
    UIFont *convertedFont = [UIFont fontWithDescriptor:[selfDescriptor fontDescriptorWithSymbolicTraits:selfDescriptor.symbolicTraits | existingTraits]
                                                  size:0.f];
    if ((convertedFont.fontDescriptor.symbolicTraits & existingTraits) == existingTraits) {
        // convert success.
        LOG_UIFont(@"convert: %@ -> %@", self.fontName, convertedFont.fontName);
        return convertedFont;
    } else {
        NSMutableArray *otherFoundFonts = @[].mutableCopy;
        for (NSString *fontName in [UIFont fontNamesForFamilyName:self.familyName]) {
            UIFont *font = [UIFont fontWithName:fontName size:self.pointSize];
            if ((font.fontDescriptor.symbolicTraits & existingTraits) == existingTraits) {
                // found first.
                LOG_UIFont(@"found first: %@ -> %@, %@", self.fontName, font.fontName, [UIFont fontNamesForFamilyName:self.familyName]);
                return font;
            } else if (!(convertedBold && convertedItalic) && (convertedBold || convertedItalic)) {
                UIFontDescriptorSymbolicTraits otherExistingTraits = convertedBold ? UIFontDescriptorTraitBold : UIFontDescriptorTraitItalic;
                if (font.fontDescriptor.symbolicTraits & otherExistingTraits) {
                    [otherFoundFonts addObject:font];
                }
            }
        }
        if ([otherFoundFonts count] > 0) {
            // when existingTraits is not found, return other found font.
            LOG_UIFont(@"other: %@ -> %@", self.fontName, ((UIFont*)[otherFoundFonts firstObject]).fontName);
            return [otherFoundFonts firstObject];
        }
    }
    // match font does not exist.
    LOG_UIFont(@"not exist: self.fontName: %@, fontNames: %@", self.fontName, [UIFont fontNamesForFamilyName:self.familyName]);
    return nil;
}

- (UIFont*)_ys_convertedNormalFont
{
    UIFontDescriptor *selfDescriptor = self.fontDescriptor;
    if (!(selfDescriptor.symbolicTraits & (UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic))) {
        LOG_UIFont(@"self: fotnName: %@, symbolicTraits: %@", self.fontName, NSStringFromUIFontDescriptorSymbolicTraits(selfDescriptor.symbolicTraits));
        return self;
    }
    
    UIFontDescriptorSymbolicTraits existingTraits;
    if (selfDescriptor.symbolicTraits & UIFontDescriptorTraitItalic) {
        existingTraits = (selfDescriptor.symbolicTraits & ~UIFontDescriptorTraitBold);
    } else {
        existingTraits = (selfDescriptor.symbolicTraits & ~UIFontDescriptorTraitBold) & (selfDescriptor.symbolicTraits & ~UIFontDescriptorTraitItalic);
    }
    
    UIFont *convertedFont = [UIFont fontWithDescriptor:[selfDescriptor fontDescriptorWithSymbolicTraits:0] size:0.f];
    if (!(convertedFont.fontDescriptor.symbolicTraits & (UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic))) {
        // convert success.
        LOG_UIFont(@"convert: %@ -> %@", self.fontName, convertedFont.fontName);
        return convertedFont;
    }
    
    for (NSString *fontName in [UIFont fontNamesForFamilyName:self.familyName]) {
        UIFont *font = [UIFont fontWithName:fontName size:self.pointSize];
        if (font.fontDescriptor.symbolicTraits == existingTraits) {
            // found first.
            LOG_UIFont(@"found first: %@ -> %@, %@", self.fontName, fontName, NSStringFromUIFontDescriptorSymbolicTraits(font.fontDescriptor.symbolicTraits));
            return font;
        }
    }
    // match font does not exist.
    LOG_UIFont(@"not exist: fontName: %@, fontNames: %@", self.fontName, [UIFont fontNamesForFamilyName:self.familyName]);
    return nil;
}

#pragma mark - language

- (BOOL)ys_hasJapaneseLanguage
{
    // ignore chinese language.
    return [self ys_hasLanguage:@"ja" ignoreLanguages:@[@"zh"]];
}

- (BOOL)ys_hasLanguage:(NSString*)language
{
    return [self ys_hasLanguage:language ignoreLanguages:nil];
}

- (BOOL)ys_hasLanguage:(NSString*)language ignoreLanguages:(NSArray*)ignoreLanguages
{
    if (![language isKindOfClass:[NSString class]] || language.length == 0) {
        return NO;
    }
    CFArrayRef attribute = CTFontDescriptorCopyAttribute((__bridge CTFontDescriptorRef)self.fontDescriptor, kCTFontLanguagesAttribute);
    BOOL hasLang = CFArrayContainsValue(attribute, CFRangeMake(0, CFArrayGetCount(attribute)), (__bridge const void *)(language));
    if (hasLang) {
        for (NSString *ignoreLang in ignoreLanguages) {
            if (CFArrayContainsValue(attribute, CFRangeMake(0, CFArrayGetCount(attribute)), (__bridge const void *)ignoreLang)) {
                hasLang = NO;
                break;
            }
        }
    }
    CFRelease(attribute);
    return hasLang;
}

@end
