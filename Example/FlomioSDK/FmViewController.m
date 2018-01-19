//
//  FmViewController.m
//  FlomioSDK
//
//  Created by scott@flomio.com on 01/18/2018.
//  Copyright (c) 2018 scott@flomio.com. All rights reserved.
//
#import "FmViewController.h"

@interface FmViewController ()

@end

@implementation FmViewController {
    NSString *_deviceUuid;
    FmSessionManager *flomioMW;
}

-(void)viewDidLoad {
    // Set SDK configuration and reader settings
    FmConfiguration *defaultConfiguration = [[FmConfiguration alloc] init];
    defaultConfiguration.deviceType = kFloBlePlus;
    defaultConfiguration.transmitPower = kHighPower;
    defaultConfiguration.powerOperation = kAutoPollingControl;
    flomioMW = [[FmSessionManager flomioMW] initWithConfiguration:defaultConfiguration];
    flomioMW.delegate = self;
}

- (void)didFindTag:(FmTag *)tag fromDevice:(NSString *)deviceUuid{
    dispatch_async(dispatch_get_main_queue(), ^{
        //Use the main queue if the UI must be updated with the tag UUID or the deviceId
        NSLog(@"Found tag UUID: %@ with ATR: %@ from device:%@",tag.uuid, tag.atr, deviceUuid);
        //        [self readData];
        
    });
    [flomioMW readNdef:deviceUuid success:^(NdefMessage *ndef) {
        NSLog(@"%@", ndef);
    }];
}

- (void)didReceiveReaderError:(NSError *)error {
    dispatch_async(dispatch_get_main_queue(), ^{ // Second dispatch message to log tag and restore screen
        NSLog(@"%@",error); //Reader error
    });
}

- (void)didChangeCardStatus:(CardStatus)status fromDevice:(NSString *)deviceUuid{
    
}

- (void)didChangeStatus:(NSString *)deviceUuid withConfiguration:(FmConfiguration *)configuration andBatteryLevel:(NSNumber *)batteryLevel andCommunicationStatus:(CommunicationStatus)communicationStatus withFirmwareRevision:(NSString *)firmwareRev withHardwareRevision:(NSString *)hardwareRev{
    _deviceUuid = deviceUuid;
}

- (void)didGetLicenseInfo:(NSString *)deviceUuid withStatus:(BOOL)isRegistered{
    
}

@end
