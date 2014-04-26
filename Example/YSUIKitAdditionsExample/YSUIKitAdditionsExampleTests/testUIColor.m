//
//  testUIColor.m
//  YSUIKitAdditionsExample
//
//  Created by Yu Sugawara on 2014/04/26.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIColor+YSUIKitAdditions.h"

@interface testUIColor : XCTestCase

@end

@implementation testUIColor

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

- (void)testGetRGBFromRGBColor
{
    CGFloat r1 = 0.123f, g1 = 0.456f, b1 = 0.789f, a1 = 1.f;
    CGFloat r2, g2, b2, a2;
    
    UIColor *color = [UIColor colorWithRed:r1 green:g1 blue:b1 alpha:a1];
    [color ys_getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    XCTAssertEqual(r1, r2, @"%f, %f", r1, r2);
    XCTAssertEqual(g1, g2, @"%f, %f", g1, g2);
    XCTAssertEqual(b1, b2, @"%f, %f", b1, b2);
    XCTAssertEqual(a1, a2, @"%f, %f", a1, a2);
}

- (void)testGetRGBFromGrayScaleColor
{
    CGFloat w = 0.123f, a1 = 1.f;
    CGFloat r, g, b, a2;
    
    UIColor *color = [UIColor colorWithWhite:w alpha:1.f];
    [color ys_getRed:&r green:&g blue:&b alpha:&a2];
    XCTAssertEqual(r, w, @"%f, %f", r, w);
    XCTAssertEqual(g, w, @"%f, %f", g, w);
    XCTAssertEqual(b, w, @"%f, %f", b, w);
    XCTAssertEqual(a1, a2, @"%f, %f", a1, a2);
}

- (void)testGetRGBFromSingleColor
{
    CGFloat r, g, b, a;
    [[UIColor blackColor] ys_getRed:&r green:&g blue:&b alpha:&a];
    XCTAssertEqual(r, 0.f, @"%f", r);
    XCTAssertEqual(g, 0.f, @"%f", g);
    XCTAssertEqual(b, 0.f, @"%f", b);
    
    [[UIColor whiteColor] ys_getRed:&r green:&g blue:&b alpha:&a];
    XCTAssertEqual(r, 1.f, @"%f", r);
    XCTAssertEqual(g, 1.f, @"%f", g);
    XCTAssertEqual(b, 1.f, @"%f", b);

    [[UIColor redColor] ys_getRed:&r green:&g blue:&b alpha:&a];
    XCTAssertEqual(r, 1.f, @"%f", r);
    XCTAssertEqual(g, 0.f, @"%f", g);
    XCTAssertEqual(b, 0.f, @"%f", b);
    
    [[UIColor greenColor] ys_getRed:&r green:&g blue:&b alpha:&a];
    XCTAssertEqual(r, 0.f, @"%f", r);
    XCTAssertEqual(g, 1.f, @"%f", g);
    XCTAssertEqual(b, 0.f, @"%f", b);

    [[UIColor blueColor] ys_getRed:&r green:&g blue:&b alpha:&a];
    XCTAssertEqual(r, 0.f, @"%f", r);
    XCTAssertEqual(g, 0.f, @"%f", g);
    XCTAssertEqual(b, 1.f, @"%f", b);
}

@end
