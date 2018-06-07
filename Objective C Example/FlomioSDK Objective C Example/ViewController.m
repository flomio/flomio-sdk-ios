//
//  ViewController.m
//  FlomioSDK Objective C Example
//
//  Created by Scott Condron on 25/01/2018.
//  Copyright © 2018 Flomio. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSString *_deviceUid;
    FmSessionManager *flomioSDK;
}

-(void)viewDidLoad {
    [self configureSDK];
}

- (void)configureSDK {
    FmConfiguration *defaultConfiguration = [[FmConfiguration alloc] init];
    defaultConfiguration.deviceType = kFloBlePlus;
    defaultConfiguration.transmitPower = kHighPower;
    defaultConfiguration.scanSound = @YES;
    defaultConfiguration.scanPeriod = @1000;
    defaultConfiguration.powerOperation = kAutoPollingControl;
    defaultConfiguration.allowMultiConnect = @NO;
    flomioSDK = [[FmSessionManager flomioSDK] initWithConfiguration:defaultConfiguration];
    flomioSDK.delegate = self;
}

- (void)didFindTag:(FmTag *)tag fromDevice:(NSString *)deviceUid{
    [tag readNdef:^(FmNdefMessage *ndef) {
        for(FmNdefRecord *record in ndef.ndefRecords) {
            NSLog(@"Record Payload: %@", record.payloadString);
        }
    }];
}

- (void)didChangeStatus:(NSString *)deviceUid withConfiguration:(FmConfiguration *)configuration andBatteryLevel:(NSNumber *)batteryLevel andCommunicationStatus:(CommunicationStatus)communicationStatus withFirmwareRevision:(NSString *)firmwareRev withHardwareRevision:(NSString *)hardwareRev{
    _deviceUid = deviceUid;
}

- (void)didChangeCardStatus:(CardStatus)status fromDevice:(NSString *)deviceUid{
    
}

- (void)didGetLicenseInfo:(NSString *)deviceUid withStatus:(BOOL)isRegistered{
    
}

- (void)didReceiveReaderError:(NSError *)error {
    NSLog(@"%@",error);
}

@end
