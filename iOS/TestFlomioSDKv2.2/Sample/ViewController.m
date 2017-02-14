//
//  ViewController.m
//  TestFlomioSDKv2.0
//
//  Created by Scott Condron on 05/07/2016.
//  Copyright © 2016 Scott Condron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSString *_deviceId;
}
//- (IBAction)initWithBT:(id)sender {
//    
//    // Set SDK configuration and reader settings
//    
//    readerManager = [FmSessionManager sharedManager];
//    readerManager.selectedDeviceType = kFloBlePlus; // For FloBLE Plus
//    //kFlojackMsr, kFlojackBzr for audiojack readers
//    readerManager.delegate = self;
//    NSDictionary *configurationDictionary = @{
//                                              @"Scan Sound" : @1,
//                                              @"Scan Period" : @1000,
//                                              @"Reader State" : [NSNumber numberWithInt:kReadUuid], //kReadData for NDEF
//                                              @"Power Operation" : [NSNumber numberWithInt:kBluetoothConnectionControl], //kBluetoothConnectionControl low power usage
//                                              };
//    
//    // Use Power Operation to control how
//    // [readerManager startReader: deviceId];
//    // and
//    // [readerManager stopReader: deviceId];
//    // control your reader.
//    // kAutoPollingControl to toggle NFC
//    // kBluetoothConnectionControl to toggle Bluetooth connection
//    
//    
//    [readerManager setConfiguration: configurationDictionary];
//    
//    [readerManager createReaders];
//    
//    // Stop reader scan when the app becomes inactive
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inactive) name:UIApplicationDidEnterBackgroundNotification object:nil];
//    // Start reader scan when the app becomes active
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(active) name:UIApplicationDidBecomeActiveNotification object:nil];
//    
//    
//}
- (IBAction)changeDeviceId:(id)sender {
    if ([readerManager.specificDeviceId isEqualToString:@"RR330-000120"]){
        readerManager.specificDeviceId = @"RR330-001141";
        NSLog(@"Device ID set to: RR330-001141");
    } else if ([readerManager.specificDeviceId isEqualToString:@"RR330-001141"]){
        readerManager.specificDeviceId = nil;
        NSLog(@"Device ID set to: nil");
    } else {
        readerManager.specificDeviceId = @"RR330-000120";
        NSLog(@"Device ID set to: RR330-000120");
    }
}

// Set your reader type:
-(void)viewDidLoad {
    // Set SDK configuration and reader settings
    
    readerManager = [FmSessionManager sharedManager];
    readerManager.selectedDeviceType = kFloBlePlus; // For FloBLE Plus
    //kFlojackMsr, kFlojackBzr for audiojack readers
    readerManager.delegate = self;
    NSDictionary *configurationDictionary = @{
                                              @"Scan Sound" : @1,
                                              @"Scan Period" : @1000,
                                              @"Reader State" : [NSNumber numberWithInt:kReadUuid], //kReadData for NDEF
                                              @"Power Operation" : [NSNumber numberWithInt:kBluetoothConnectionControl], //kBluetoothConnectionControl low power usage
                                              @"Allow Multiconnect" : @0, //control whether multiple FloBLE devices can connect
                                              };
    
    [readerManager setConfiguration: configurationDictionary];
    
    [readerManager createReaders];
    
    // Stop reader scan when the app becomes inactive
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inactive) name:UIApplicationDidEnterBackgroundNotification object:nil];
    // Start reader scan when the app becomes active
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(active) name:UIApplicationDidBecomeActiveNotification object:nil];
    

}


- (void)active {
    NSLog(@"App Activated");
}

- (void)inactive {
    NSLog(@"App Inactive");
}


- (void)didFindTagWithUuid:(NSString *)Uuid fromDevice:(NSString *)deviceId withAtr:(NSString *)Atr withError:(NSError *)error{
    dispatch_async(dispatch_get_main_queue(), ^{
        //Use the main queue if the UI must be updated with the tag UUID or the deviceId
        NSLog(@"Found tag UUID: %@ from device:%@",Uuid,deviceId);
    });
}

- (void)didFindTagWithData:(NSDictionary *)payload fromDevice:(NSString *)deviceId withAtr:(NSString *)Atr withError:(NSError *)error{
    dispatch_async(dispatch_get_main_queue(), ^{
        //Use the main queue if the UI must be updated with the tag data or the deviceId
        if (payload[@"Raw Data"]){
            NSLog(@"Found raw data: %@ from device:%@",payload[@"Raw Data"] ,deviceId);
        } else if (payload[@"Ndef"]) {
            NSLog(@"Found Ndef Message: %@ from device:%@",payload[@"Ndef"] ,deviceId);
        }
    });
}

- (void)didReceiveReaderError:(NSError *)error {
    dispatch_async(dispatch_get_main_queue(), ^{ // Second dispatch message to log tag and restore screen
        NSLog(@"%@",error); //Reader error
    });
}

- (void)didUpdateConnectedDevices:(NSArray *)connectedDevices {
    //The list of connected devices was updated
    for (FmDevice *device in connectedDevices){
        _deviceId = device.serialNumber;
    }
}


- (void)didChangeCardStatus:(CardStatus)status fromDevice:(NSString *)deviceId {
    //The card status has entered or left the scan range of the reader
}


- (IBAction)sleep:(id)sender {
    [readerManager sleepReader:_deviceId];
}

- (IBAction)startPolling:(id)sender {
    [readerManager startReaders];
}

- (IBAction)stopPolling:(id)sender {
    [readerManager stopReaders];
}

- (IBAction)sendApdu:(id)sender {
    [readerManager sendApdu:@"00 A4 04 00 0E 32 50 41 59 2E 53 59 53 2E 44 44 46 30 31 00" toDevice:_deviceId];
}


@end
