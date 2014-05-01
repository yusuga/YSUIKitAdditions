//
//  UIFont+YSUIKitAdditions.h
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/04/30.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *NSStringFromUIFontDescriptorSymbolicTraits(UIFontDescriptorSymbolicTraits symbol);

@interface UIFont (YSUIKitAdditions)

// when can not convert it, return nil
- (UIFont*)ys_convertedNormalFont;      // e.g. bold -> normal, italic -> normal, bold italic -> italic
- (UIFont*)ys_convertedBoldFont;        // e.g. normal -> bold, italic -> bold italic
- (UIFont*)ys_convertedItalicFont;      // e.g. normal -> italic, bold -> bold italic
- (UIFont*)ys_convertedBoldItalicFont;

// The language identifier string should conform to the BCP 47 standard. ( http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes )
- (BOOL)ys_hasJapaneseLanguage;
- (BOOL)ys_hasLanguage:(NSString*)language;
- (BOOL)ys_hasLanguage:(NSString*)language ignoreLanguages:(NSArray*)ignoreLanguages;

@end
