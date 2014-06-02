//
//  PhoneCallMonitor.h
//  getNotification
//
//  Created by Rahul Malik on 30/05/14.
//  Copyright (c) 2014 Rahul Malik. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <IOBluetooth/IOBluetooth.h>

@protocol CallServerDelegate;
@interface PhoneCallMonitor : NSObject <IOBluetoothHandsFreeDelegate, IOBluetoothHandsFreeDeviceDelegate>{
    IOBluetoothHandsFreeDevice *registerDevice;
    BOOL Some1Calling;
}
@property (nonatomic, assign) id<CallServerDelegate> delegate;
@end
@protocol CallServerDelegate <NSObject>

-(void)CallServer:(NSString *)FromNumber;
-(void)PickUpCall;
@optional
@end