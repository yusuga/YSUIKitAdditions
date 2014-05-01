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

// when can not convert it, return self
- (UIFont*)ys_convertedNormalFont;      // e.g. bold -> normal, italic -> normal, bold italic -> italic
- (UIFont*)ys_convertedBoldFont;        // e.g. normal -> bold, italic -> bold italic
- (UIFont*)ys_convertedItalicFont;      // e.g. normal -> italic, bold -> bold italic
- (UIFont*)ys_convertedBoldItalicFont;

@end
