//
//  NMProgressHUDManager.h
//  JustBook
//
//  Created by Nicola Miotto on 8/20/12.
//  Copyright (c) 2012 JustBook Mobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"

@interface NMProgressHUDManager : NSObject

// Progress HUD with identifiers
+ (void)showWithIdentifier:(NSString *)identifier;
+ (void)showWithMaskType:(SVProgressHUDMaskType)maskType
              identifier:(NSString *)identifier;

+ (void)showWithStatus:(NSString*)status
                   identifier:(NSString *)identifier;
+ (void)showWithStatus:(NSString*)status 
              maskType:(SVProgressHUDMaskType)maskType
            identifier:(NSString *)identifier;

+ (void)setStatus:(NSString*)string
       identifier:(NSString *)identifier; // change the HUD loading status while it's showing

// stops the activity indicator, shows a glyph + status, and dismisses HUD 1s later
+ (void)showSuccessWithStatus:(NSString*)string
                   identifier:(NSString *)identifier;
+ (void)showErrorWithStatus:(NSString *)string
                 identifier:(NSString *)identifierg;
+ (void)showImage:(UIImage*)image status:(NSString*)status
       identifier:(NSString *)identifier; // use 28x28 white pngs

+ (void)dismissWithIdentifier:(NSString *)identifier;

//+ (BOOL)isVisibleWithtag:(NSInteger)tag;

@end
