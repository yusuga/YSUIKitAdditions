//
//  testUIFont.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/04/30.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIFont+YSUIKitAdditions.h"

@interface testUIFont : XCTestCase

@end

@implementation testUIFont

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (NSArray*)allFont
{
    NSMutableArray *fonts = @[].mutableCopy;
    for (NSString *familyName in [UIFont familyNames]) {
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            [fonts addObject:[UIFont fontWithName:fontName size:1.f]];
        }
    }
    return fonts;
}

#pragma mark - convert

- (void)testConvertNormalFont
{
    for (UIFont *font in [self allFont]) {
        UIFont *convertedFont = [font ys_convertedNormalFont];
        if (convertedFont == nil &&
            font.fontDescriptor.symbolicTraits &
            (UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic ^ (font.fontDescriptor.symbolicTraits & UIFontDescriptorTraitItalic))) {
            for (NSString *name in [UIFont fontNamesForFamilyName:font.familyName]) {
                UIFont *font = [UIFont fontWithName:name size:1.f];
                if (!(font.fontDescriptor.symbolicTraits & (UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic))) {
                    XCTAssert(0, @"font: %@, symbolicTraits: %@, fontNames: %@", font.fontName, NSStringFromUIFontDescriptorSymbolicTraits(font.fontDescriptor.symbolicTraits), [UIFont fontNamesForFamilyName:font.familyName]);
                }
            }
        }
    }
}

- (void)testConvertBoldFont
{
    for (UIFont *font in [self allFont]) {
        UIFont *convertedFont = [font ys_convertedBoldFont];
        if (convertedFont == nil && !(font.fontDescriptor.symbolicTraits & UIFontDescriptorTraitBold)) {
            for (NSString *name in [UIFont fontNamesForFamilyName:font.familyName]) {
                UIFont *font = [UIFont fontWithName:name size:1.f];
                if (font.fontDescriptor.symbolicTraits & UIFontDescriptorTraitBold) {
                    XCTAssert(0, @"font: %@, fontNames: %@", font.fontName, [UIFont fontNamesForFamilyName:font.familyName]);
                }
            }
        }
    }
}

- (void)testConvertItalicFont
{
    for (UIFont *font in [self allFont]) {
        UIFont *convertedFont = [font ys_convertedItalicFont];
        if (convertedFont == nil && !(font.fontDescriptor.symbolicTraits & UIFontDescriptorTraitItalic)) {
            for (NSString *name in [UIFont fontNamesForFamilyName:font.familyName]) {
                UIFont *font = [UIFont fontWithName:name size:1.f];
                if (font.fontDescriptor.symbolicTraits & UIFontDescriptorTraitItalic) {
                    XCTAssert(0, @"font: %@, fontNames: %@", font.fontName, [UIFont fontNamesForFamilyName:font.familyName]);
                }
            }
        }
    }
}

- (void)testConvertBoldItalicFont
{
    UIFontDescriptorSymbolicTraits existingTraits = UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic;
    for (UIFont *font in [self allFont]) {
        UIFont *convertedFont = [font ys_convertedBoldItalicFont];
        if (convertedFont == nil && (font.fontDescriptor.symbolicTraits & existingTraits) != existingTraits) {
            for (NSString *name in [UIFont fontNamesForFamilyName:font.familyName]) {
                UIFont *font = [UIFont fontWithName:name size:1.f];
                if ((font.fontDescriptor.symbolicTraits & existingTraits) == existingTraits) {
                    XCTAssert(0, @"font: %@, fontNames: %@", font.fontName, [UIFont fontNamesForFamilyName:font.familyName]);
                }
            }
        }
    }
}

#pragma mark - has language

- (void)testHasLanguage
{
    NSArray *jpFontNames = @[@"HiraKakuProN-W6", @"HiraKakuProN-W3", @"HiraMinProN-W6", @"HiraMinProN-W3"];
    for (UIFont *font in [self allFont]) {
        if ([font ys_hasJapaneseLanguage]) {
            XCTAssert([jpFontNames containsObject:font.fontName], @"%@", font.fontName);
        }
    }
}

@end
