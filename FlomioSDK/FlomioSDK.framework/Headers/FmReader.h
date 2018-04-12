//
//  FmReader.h
//  SDK
//
//  Created by Scott Condron on 23/11/2016.
//  Copyright © 2016 Flomio, Inc. All rights reserved.
//
//
//Responsibilities
//control reader
//monitor scanner
//control tag
//monitor reader condition
//notify session of reader condition
//notify session of tag detection

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "FmConfiguration.h"
#import "FmErrorManager.h"
#import "Utilities.h"
#import "FmNdefMessage.h"

@protocol FmReaderDelegate<NSObject>

@required

- (void)didAddTagToUidInventory:(NSString *)uid;
- (void)didFindExistingTag:(NSString *)uid;
- (void)didGetAtr:(NSString *)atr;
- (void)didGetBatteryLevel:(NSInteger)batteryLevel;
- (void)didGetCommunicationStatus:(CommunicationStatus)communicationStatus;
- (void)didChangeCardStatus:(CardStatus)status fromDevice:(NSString *)device;
- (void)didGetDeviceInfoWith:(NSString *)deviceUid withFirmwareRevision:(NSString *)firmwareRev withHardwareRevision:(NSString *)hardwareRev;
- (void)didReceiveReaderError:(NSError *)error;

@end

@interface FmReader : NSObject

@property (nonatomic, strong) id<FmReaderDelegate> delegate;
@property (nonatomic, assign) DeviceType type;
@property (nonatomic) NSUInteger batteryLevel;
@property (nonatomic, strong) NSString *deviceUid;
@property (nonatomic, strong) NSString *hardwareRevision;
@property (nonatomic, strong) NSString *firmwareRevision;

@property (nonatomic, strong) NSMutableArray *tagUidInventory;
@property (nonatomic, strong) NSString *currentAtr;
@property (nonatomic, strong) NSString *currentUid;
@property (nonatomic, strong) NSString *currentApdu;
@property (nonatomic, strong) NSString *currentResponse;
@property (nonatomic, strong) NSString *apduRequestUid;

//These methods which must be overwritten by subclassess

//init used for BT readers
- (instancetype)initWithPeripheral:(CBPeripheral *)peripheral andConfiguration:(FmConfiguration *)configuration;
//init used for AJ readers
+ (instancetype)initSharedInstanceWithParent:(id)parent andConfiguration:(FmConfiguration *)confuration;
- (void)setConfiguration:(FmConfiguration *)configuration;
- (void)getDeviceInfo;
- (void)startReader;
- (void)stopReader;
- (void)sleepReader;
- (void)sendApduCommand:(NSString *)command success:(void (^)(NSString *))completionBlock;

//Other methods used by individual readers

- (void)wakeReader;
- (void)reconnectBluetoothReader;
- (void)updateCeNdef:(FmNdefMessage *)ndef;

//General Methods exclusive to FmReader superclass
- (BOOL)determineIfNewUid:(NSString *)uid;
- (void)addUidToTagInventory:(NSString *)uid;
- (NSString *)handleApduResponse:(NSString *)responseString;
- (void)writeRfidTag:(NSData *)data withOffset:(int)offset success:(void (^)(NSString *))completionBlock;
- (void)readRfidTag:(int)offset success:(void (^)(NSString *))completionBlock;

@end
