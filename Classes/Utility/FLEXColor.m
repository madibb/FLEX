//
//  FLEXColor.m
//  FLEX
//
//  Created by Benny Wong on 6/18/19.
//  Copyright © 2020 FLEX Team. All rights reserved.
//

#import "FLEXColor.h"

@implementation FLEXColor

#pragma mark - Background Colors

+ (UIColor *)primaryBackgroundColor {
    return UIColor.systemBackgroundColor;
}

+ (UIColor *)primaryBackgroundColorWithAlpha:(CGFloat)alpha {
    return [[self primaryBackgroundColor] colorWithAlphaComponent:alpha];
}

+ (UIColor *)secondaryBackgroundColor {
    return UIColor.secondarySystemBackgroundColor;
}

+ (UIColor *)secondaryBackgroundColorWithAlpha:(CGFloat)alpha {
    return [[self secondaryBackgroundColor] colorWithAlphaComponent:alpha];
}

+ (UIColor *)tertiaryBackgroundColor {
    return UIColor.systemGray4Color;
}

+ (UIColor *)tertiaryBackgroundColorWithAlpha:(CGFloat)alpha {
    return [[self tertiaryBackgroundColor] colorWithAlphaComponent:alpha];
}

+ (UIColor *)groupedBackgroundColor {
    return UIColor.systemGroupedBackgroundColor;
}

+ (UIColor *)groupedBackgroundColorWithAlpha:(CGFloat)alpha {
    return [[self groupedBackgroundColor] colorWithAlphaComponent:alpha];
}

+ (UIColor *)secondaryGroupedBackgroundColor {
    return UIColor.secondarySystemGroupedBackgroundColor;
}

+ (UIColor *)secondaryGroupedBackgroundColorWithAlpha:(CGFloat)alpha {
    return [[self secondaryGroupedBackgroundColor] colorWithAlphaComponent:alpha];
}

#pragma mark - Text colors

+ (UIColor *)primaryTextColor {
    return UIColor.labelColor;
}

+ (UIColor *)deemphasizedTextColor {
    return UIColor.secondaryLabelColor;
}

#pragma mark - UI Element Colors

+ (UIColor *)tintColor {
    return UIColor.systemBlueColor;
}

+ (UIColor *)scrollViewBackgroundColor {
    return UIColor.systemGroupedBackgroundColor;
}

+ (UIColor *)iconColor {
    return UIColor.labelColor;
}

+ (UIColor *)borderColor {
    return [self primaryBackgroundColor];
}

+ (UIColor *)toolbarItemHighlightedColor {
    return UIColor.quaternaryLabelColor;
}

+ (UIColor *)toolbarItemSelectedColor {
    return UIColor.secondaryLabelColor;
}

+ (UIColor *)hairlineColor {
    return UIColor.systemGray3Color;
}

+ (UIColor *)destructiveColor {
    return UIColor.systemRedColor;
}

@end
