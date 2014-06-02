//
//  AppDelegate.h
//  getNotification
//
//  Created by Rahul Malik on 30/05/14.
//  Copyright (c) 2014 Rahul Malik. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BLMNSService.h"
@interface AppDelegate : NSObject <NSApplicationDelegate,BLMNSServiceDelegate,NSUserNotificationCenterDelegate>
{
    BLMNSService *service;
}
@property (assign) IBOutlet NSWindow *window;

@end
