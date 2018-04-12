//
//  ReaderManager.h
//  SDK
//
//  Created by Richard Grundy on 11/16/14.
//  Copyright (c) 2014 Flomio, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "FmBluetoothConnectionsManager.h"
#import "FmAudioJackConnectionsManager.h"

#import "FmSession.h"
#import "FmConfiguration.h"

@protocol FmSessionManagerDelegate<NSObject>

@optional

- (void)didFindTag:(FmTag *)tag fromDevice:(NSString *)deviceUid;
- (void)didReceiveReaderError:(NSError *)error;
- (void)didChangeCardStatus:(CardStatus)status fromDevice:(NSString *)device;
- (void)didChangeStatus:(NSString *)deviceUid withConfiguration:(FmConfiguration *)configuration andBatteryLevel:(NSNumber *)batteryLevel andCommunicationStatus:(CommunicationStatus)communicationStatus withFirmwareRevision:(NSString *)firmwareRev withHardwareRevision:(NSString *)hardwareRev;
- (void)didGetLicenseInfo:(NSString *)deviceUid withStatus:(BOOL)isRegistered;

// Bluetooth Methods
- (void)didMasterKeyUpdate:(BOOL)success withError:(NSError *)error;

@end

@interface FmSessionManager : NSObject <FmSessionDelegate, FmAudioJackConnectionsManagerDelegate, FmBluetoothConnectionsManagerDelegate> {
    
    // Reader Variables
    AVAudioPlayer *_audioPlayer;
    BOOL isAppLaunching;
    
    //2.0
}

+ (id)flomioSDK; //flomioSDK singleton

- (id)initWithConfiguration:(FmConfiguration *)configuration;
- (void)startReaders;
- (void)stopReaders;
- (void)sleepReaders;
- (void)startReader:(NSString *)deviceUid;
- (void)stopReader:(NSString *)deviceUid;
- (void)sleepReader:(NSString *)deviceUid;
- (void)updateCeNdef:(FmNdefMessage *)ndef withDeviceUid:(NSString *)deviceUid;
- (void)writeRfidTag:(NSData *)data withOffset:(int)offset success:(void (^)(NSString *))completionBlock;
- (void)readRfidTag:(int)offset success:(void (^)(NSString *))completionBlock;

- (void)setConfiguration:(FmConfiguration *)configuration; //initialize all devices configuration with this
- (void)setConfiguration:(FmConfiguration *)configuration ofDevice:(NSString *)deviceUid;
- (FmConfiguration *)getConfiguration:(NSString *)deviceUid;
- (void)sendApdu:(NSString *)apdu toDevice:(NSString *)deviceUid success:(void (^)(NSString *))completionBlock;

@property (nonatomic, strong) id<FmSessionManagerDelegate> delegate;
@property (nonatomic, strong) FmConnectionsManager *connectionsManager;
@property (nonatomic, strong) FmConfiguration *configuration;
@property (nonatomic, strong) NSMutableArray<FmSession *> *sessions;
@end

