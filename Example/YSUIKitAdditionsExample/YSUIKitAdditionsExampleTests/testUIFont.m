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

- (void)testConvertNormalFont
{
    for (UIFont *font in [self allFont]) {
        UIFont *convertedFont = [font ys_convertedNormalFont];
        if (convertedFont.fontDescriptor.symbolicTraits &
            (UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic ^ (font.fontDescriptor.symbolicTraits & UIFontDescriptorTraitItalic))) {
            for (NSString *name in [UIFont fontNamesForFamilyName:convertedFont.familyName]) {
                UIFont *font = [UIFont fontWithName:name size:1.f];
                if (!(font.fontDescriptor.symbolicTraits & (UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic))) {
                    XCTAssert(0, @"convertedFont: %@, symbolicTraits: %@, fontNames: %@", convertedFont.fontName, NSStringFromUIFontDescriptorSymbolicTraits(font.fontDescriptor.symbolicTraits), [UIFont fontNamesForFamilyName:convertedFont.familyName]);
                }
            }
        }
    }
}

- (void)testConvertBoldFont
{
    for (UIFont *font in [self allFont]) {
        UIFont *convertedFont = [font ys_convertedBoldFont];
        if (!(convertedFont.fontDescriptor.symbolicTraits & UIFontDescriptorTraitBold)) {
            for (NSString *name in [UIFont fontNamesForFamilyName:convertedFont.familyName]) {
                UIFont *font = [UIFont fontWithName:name size:1.f];
                if (font.fontDescriptor.symbolicTraits & UIFontDescriptorTraitBold) {
                    XCTAssert(0, @"convertedFont: %@, fontNames: %@", convertedFont.fontName, [UIFont fontNamesForFamilyName:convertedFont.familyName]);
                }
            }
        }
    }
}

- (void)testConvertItalicFont
{
    for (UIFont *font in [self allFont]) {
        UIFont *convertedFont = [font ys_convertedItalicFont];
        if (!(convertedFont.fontDescriptor.symbolicTraits & UIFontDescriptorTraitItalic)) {
            for (NSString *name in [UIFont fontNamesForFamilyName:convertedFont.familyName]) {
                UIFont *font = [UIFont fontWithName:name size:1.f];
                if (font.fontDescriptor.symbolicTraits & UIFontDescriptorTraitItalic) {
                    XCTAssert(0, @"convertedFont: %@, fontNames: %@", convertedFont.fontName, [UIFont fontNamesForFamilyName:convertedFont.familyName]);
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
        if ((convertedFont.fontDescriptor.symbolicTraits & existingTraits) != existingTraits) {
            for (NSString *name in [UIFont fontNamesForFamilyName:convertedFont.familyName]) {
                UIFont *font = [UIFont fontWithName:name size:1.f];
                if ((font.fontDescriptor.symbolicTraits & existingTraits) == existingTraits) {
                    XCTAssert(0, @"convertedFont: %@, fontNames: %@", convertedFont.fontName, [UIFont fontNamesForFamilyName:convertedFont.familyName]);
                }
            }
        }
    }
}

@end