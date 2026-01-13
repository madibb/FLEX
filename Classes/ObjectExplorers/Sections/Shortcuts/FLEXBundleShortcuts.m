//
//  FLEXBundleShortcuts.m
//  FLEX
//
//  Created by Tanner Bennett on 12/12/19.
//  Copyright © 2020 FLEX Team. All rights reserved.
//

#import "FLEXBundleShortcuts.h"
#import "FLEXShortcut.h"
#import "FLEXFileBrowserController.h"

#pragma mark -
@implementation FLEXBundleShortcuts
#pragma mark Overrides

+ (instancetype)forObject:(NSBundle *)bundle {
    return [self forObject:bundle additionalRows:@[
        [FLEXActionShortcut
            title:@"Browse Bundle Directory" subtitle:nil
            viewer:^UIViewController *(NSBundle *bundle) {
                return [FLEXFileBrowserController path:bundle.bundlePath];
            }
            accessoryType:^UITableViewCellAccessoryType(NSBundle *bundle) {
                return UITableViewCellAccessoryDisclosureIndicator;
            }
        ],
    ]];
}

@end
