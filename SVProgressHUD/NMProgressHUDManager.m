//
//  NMProgressHUDManager.m
//  JustBook
//
//  Created by Nicola Miotto on 8/20/12.
//  Copyright (c) 2012 JustBook Mobile GmbH. All rights reserved.
//

#import "NMProgressHUDManager.h"
#import <QuartzCore/QuartzCore.h>

@interface NMProgressHUDManager ()
@property (nonatomic, strong) NSMutableDictionary *shownProgressViews;
@end


@implementation NMProgressHUDManager

@synthesize shownProgressViews;

+ (SVProgressHUD*)viewWithIdentifier:(NSString *)identifier {
    
    SVProgressHUD *progressHUD = [[NMProgressHUDManager sharedManager].shownProgressViews objectForKey:identifier];
    if (progressHUD == nil) {
        progressHUD = [[SVProgressHUD alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [[NMProgressHUDManager sharedManager].shownProgressViews setObject:progressHUD forKey:identifier];
    }
    
    return progressHUD;
}

+ (NMProgressHUDManager*)sharedManager {
    static dispatch_once_t once;
    static NMProgressHUDManager *sharedManager;
    dispatch_once(&once, ^ { 
        sharedManager = [[NMProgressHUDManager alloc] init]; 
        sharedManager.shownProgressViews = [[NSMutableDictionary alloc] init];
    });
    return sharedManager;
}


+ (void)setStatus:(NSString *)string
            identifier:(NSString *)identifier{
	[[NMProgressHUDManager viewWithIdentifier:identifier] setStatus:string];
}

#pragma mark - Show Methods

+ (void)showWithIdentifier:(NSString *)identifier {
    [[NMProgressHUDManager viewWithIdentifier:identifier] show];
}

+ (void)showWithStatus:(NSString *)status
                   identifier:(NSString *)identifier {
    [[NMProgressHUDManager viewWithIdentifier:identifier] showWithStatus:status];
}

+ (void)showWithMaskType:(SVProgressHUDMaskType)maskType
                     identifier:(NSString *)identifier{
    [[NMProgressHUDManager viewWithIdentifier:identifier] showWithMaskType:maskType];
}

+ (void)showWithStatus:(NSString*)status 
              maskType:(SVProgressHUDMaskType)maskType
                   identifier:(NSString *)identifier{
    [[NMProgressHUDManager viewWithIdentifier:identifier] showWithStatus:status maskType:maskType];
}

+ (void)showImage:(UIImage*)image 
           status:(NSString*)status
              identifier:(NSString *)identifier {
    
    [[NMProgressHUDManager viewWithIdentifier:identifier] showImage:image status:status];
}

#pragma mark - Show then dismiss methods

+ (void)showSuccessWithStatus:(NSString *)string
                   identifier:(NSString *)identifier {
    //[NMProgressHUDManager dismissWithIdentifier:string];
    //[NMProgressHUDManager showWithIdentifier:string];
    [[NMProgressHUDManager viewWithIdentifier:identifier] showSuccessWithStatus:string];
}

+ (void)showErrorWithStatus:(NSString *)string 
                        identifier:(NSString *)identifier {
    [[NMProgressHUDManager viewWithIdentifier:identifier] showErrorWithStatus:string];
}


#pragma mark - Dismiss Methods

+ (void)dismissWithIdentifier:(NSString *)identifier {
    SVProgressHUD *progressHUD = [NMProgressHUDManager viewWithIdentifier:identifier];
    [progressHUD dismiss];
    [[NMProgressHUDManager sharedManager].shownProgressViews removeObjectForKey:identifier];
}

@end
