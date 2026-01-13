//
//  FLEXResources.m
//  FLEX
//
//  Created by Ryan Olson on 6/8/14.
//  Copyright (c) 2020 FLEX Team. All rights reserved.
//

#import "FLEXResources.h"

@implementation FLEXResources

#pragma mark - Helpers

/// Returns an SF Symbol image with the given name
+ (UIImage *)symbolWithName:(NSString *)name {
    return [UIImage systemImageNamed:name];
}

/// Returns an SF Symbol as a template image for toolbar use
+ (UIImage *)toolbarSymbol:(NSString *)name {
    UIImageSymbolConfiguration *config = [UIImageSymbolConfiguration
        configurationWithPointSize:22 weight:UIImageSymbolWeightRegular];
    UIImage *image = [UIImage systemImageNamed:name withConfiguration:config];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

/// Returns an SF Symbol as a template image for content type icons
+ (UIImage *)contentTypeSymbol:(NSString *)name {
    UIImageSymbolConfiguration *config = [UIImageSymbolConfiguration
        configurationWithPointSize:24 weight:UIImageSymbolWeightRegular];
    return [UIImage systemImageNamed:name withConfiguration:config];
}


#pragma mark - FLEX Toolbar Icons

+ (UIImage *)closeIcon {
    return [self toolbarSymbol:@"xmark"];
}

+ (UIImage *)dragHandle {
    // Create a simple drag handle programmatically (5 rows of dots)
    CGSize size = CGSizeMake(80, 20);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    [[UIColor colorWithWhite:0.5 alpha:1.0] setFill];

    CGFloat dotRadius = 2.0;
    CGFloat spacing = 8.0;
    CGFloat startX = (size.width - (9 * spacing)) / 2;
    CGFloat y = size.height / 2;

    for (int i = 0; i < 10; i++) {
        CGFloat x = startX + (i * spacing);
        CGContextFillEllipseInRect(ctx, CGRectMake(x - dotRadius, y - dotRadius, dotRadius * 2, dotRadius * 2));
    }

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

+ (UIImage *)globalsIcon {
    return [self toolbarSymbol:@"list.bullet"];
}

+ (UIImage *)hierarchyIcon {
    return [self toolbarSymbol:@"square.stack.3d.up"];
}

+ (UIImage *)recentIcon {
    return [self toolbarSymbol:@"clock"];
}

+ (UIImage *)moveIcon {
    return [self toolbarSymbol:@"arrow.up.and.down.and.arrow.left.and.right"];
}

+ (UIImage *)selectIcon {
    return [self toolbarSymbol:@"hand.tap"];
}


#pragma mark - Toolbar Icons

+ (UIImage *)bookmarksIcon {
    return [self toolbarSymbol:@"bookmark"];
}

+ (UIImage *)openTabsIcon {
    return [self toolbarSymbol:@"square.on.square"];
}

+ (UIImage *)moreIcon {
    return [self toolbarSymbol:@"ellipsis.circle"];
}

+ (UIImage *)gearIcon {
    return [self toolbarSymbol:@"gearshape"];
}

+ (UIImage *)scrollToBottomIcon {
    return [self toolbarSymbol:@"arrow.down.circle"];
}


#pragma mark - Content Type Icons

+ (UIImage *)jsonIcon {
    return [self contentTypeSymbol:@"curlybraces"];
}

+ (UIImage *)textPlainIcon {
    return [self contentTypeSymbol:@"doc.text"];
}

+ (UIImage *)htmlIcon {
    return [self contentTypeSymbol:@"doc.richtext"];
}

+ (UIImage *)audioIcon {
    return [self contentTypeSymbol:@"waveform"];
}

+ (UIImage *)jsIcon {
    return [self contentTypeSymbol:@"doc.badge.gearshape"];
}

+ (UIImage *)plistIcon {
    return [self contentTypeSymbol:@"list.bullet.rectangle"];
}

+ (UIImage *)textIcon {
    return [self contentTypeSymbol:@"doc.text"];
}

+ (UIImage *)videoIcon {
    return [self contentTypeSymbol:@"play.rectangle"];
}

+ (UIImage *)xmlIcon {
    return [self contentTypeSymbol:@"chevron.left.forwardslash.chevron.right"];
}

+ (UIImage *)binaryIcon {
    return [self contentTypeSymbol:@"doc.fill"];
}


#pragma mark - 3D Explorer Icons

+ (UIImage *)toggle2DIcon {
    UIImageSymbolConfiguration *config = [UIImageSymbolConfiguration
        configurationWithPointSize:20 weight:UIImageSymbolWeightMedium];
    return [UIImage systemImageNamed:@"square" withConfiguration:config];
}

+ (UIImage *)toggle3DIcon {
    UIImageSymbolConfiguration *config = [UIImageSymbolConfiguration
        configurationWithPointSize:20 weight:UIImageSymbolWeightMedium];
    return [UIImage systemImageNamed:@"cube" withConfiguration:config];
}

+ (UIImage *)rangeSliderLeftHandle {
    // Create a simple circular handle
    CGSize size = CGSizeMake(28, 28);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // White fill with shadow effect
    [[UIColor whiteColor] setFill];
    [[UIColor colorWithWhite:0.7 alpha:1.0] setStroke];
    CGContextSetLineWidth(ctx, 1.0);

    CGRect rect = CGRectInset(CGRectMake(0, 0, size.width, size.height), 2, 2);
    CGContextFillEllipseInRect(ctx, rect);
    CGContextStrokeEllipseInRect(ctx, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)rangeSliderRightHandle {
    return [self rangeSliderLeftHandle];
}

+ (UIImage *)rangeSliderTrack {
    // Create a simple track
    CGSize size = CGSizeMake(10, 4);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    [[UIColor colorWithWhite:0.85 alpha:1.0] setFill];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height)
                                                    cornerRadius:2.0];
    [path fill];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    UIEdgeInsets cap = UIEdgeInsetsMake(0, 5, 0, 4);
    return [image resizableImageWithCapInsets:cap];
}

+ (UIImage *)rangeSliderFill {
    // Create a simple fill track
    CGSize size = CGSizeMake(10, 4);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    [[UIColor colorWithRed:0.0 green:0.478 blue:1.0 alpha:1.0] setFill];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height)
                                                    cornerRadius:2.0];
    [path fill];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    UIEdgeInsets cap = UIEdgeInsetsMake(0, 5, 0, 4);
    return [image resizableImageWithCapInsets:cap];
}


#pragma mark - Misc Icons

+ (UIImage *)checkerPattern {
    // Create a simple checker pattern for transparency visualization
    CGFloat squareSize = 8.0;
    CGSize size = CGSizeMake(squareSize * 2, squareSize * 2);
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);

    [[UIColor whiteColor] setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));

    [[UIColor colorWithWhite:0.85 alpha:1.0] setFill];
    UIRectFill(CGRectMake(0, 0, squareSize, squareSize));
    UIRectFill(CGRectMake(squareSize, squareSize, squareSize, squareSize));

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIColor *)checkerPatternColor {
    return [UIColor colorWithPatternImage:FLEXResources.checkerPattern];
}

+ (UIImage *)hierarchyIndentPattern {
    // Create a simple indent pattern for hierarchy display
    CGSize size = CGSizeMake(16, 1);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);

    [[UIColor colorWithWhite:0.8 alpha:1.0] setFill];
    UIRectFill(CGRectMake(0, 0, 1, 1));

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@end
