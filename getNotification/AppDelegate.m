//
//  AppDelegate.m
//  getNotification
//
//  Created by Rahul Malik on 30/05/14.
//  Copyright (c) 2014 Rahul Malik. All rights reserved.
//

#import "AppDelegate.h"
#import <IOBluetooth/IOBluetooth.h>
#import <IOBluetoothUI/IOBluetoothUI.h>
#import "PhoneCallMonitor.h"
@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    service = [[BLMNSService alloc] init];
    [service setDelegate:self];
    [[NSUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];
    [self connectToDevice];
}


- (void)connectToDevice {
    IOBluetoothDeviceSelectorController *ff = [IOBluetoothDeviceSelectorController deviceSelector];
    int t = [ff runModal];
    
    if (t == kIOBluetoothUISuccess) {
        IOBluetoothDevice *device = [[[ff getResults] lastObject] retain];
        if ([device openConnection] == kIOReturnSuccess) {
            NSLog(@"Connection open");
        } else {
            NSLog(@"Connection failed");
        }
        if ([device isConnected]) {
            NSLog(@"Working Called");
            PhoneCallMonitor *some = [[PhoneCallMonitor alloc] init];
            [some postRegistrationInit];
            [service startListening:device reconnect:NO];
        }
    }
}

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center shouldPresentNotification:(NSUserNotification *)notification{
    return YES;
}
- (IBAction)clickMe:(id)sender {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"call" object:nil];
}
- (void)mnsService:(BLMNSService *)service messageReceived:(NSDictionary *)message{
     NSUserNotification *notification = [[NSUserNotification alloc] init];
    notification.title = @"Emosewa";
    notification.informativeText = [message valueForKey:@"body"];
    notification.soundName = NSUserNotificationDefaultSoundName;

    [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];
}
-(void)registerForRemoteNotificationTypes:(id)some{
}


- (void) testPrint {
    //currentFilePath = @"/Users/oyvind/Desktop/_DSC8797.jpg";
    //[self sendFile:currentFilePath];
}


@end
