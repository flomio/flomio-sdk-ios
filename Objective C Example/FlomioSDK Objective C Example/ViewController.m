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
    NSString *_deviceUuid;
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
    defaultConfiguration.transmitPower = kHighPower;
    defaultConfiguration.allowMultiConnect = @NO;
    flomioSDK = [[FmSessionManager flomioSDK] initWithConfiguration:defaultConfiguration];
    flomioSDK.delegate = self;
}

- (void)didFindTag:(FmTag *)tag fromDevice:(NSString *)deviceUuid{
    [tag readNdef:^(NdefMessage *ndef) {
        for(NdefRecord *record in ndef.ndefRecords) {
            NSLog(@"Record Payload: %@", record.payloadString);
        }
    }];
}

- (void)didChangeStatus:(NSString *)deviceUuid withConfiguration:(FmConfiguration *)configuration andBatteryLevel:(NSNumber *)batteryLevel andCommunicationStatus:(CommunicationStatus)communicationStatus withFirmwareRevision:(NSString *)firmwareRev withHardwareRevision:(NSString *)hardwareRev{
    _deviceUuid = deviceUuid;
}

- (void)didChangeCardStatus:(CardStatus)status fromDevice:(NSString *)deviceUuid{
    
}

- (void)didGetLicenseInfo:(NSString *)deviceUuid withStatus:(BOOL)isRegistered{
    
}

- (void)didReceiveReaderError:(NSError *)error {
    NSLog(@"%@",error);
}

@end
