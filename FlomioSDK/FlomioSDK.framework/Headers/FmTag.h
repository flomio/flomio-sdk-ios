//
//  Tag.h
//  SDK
//
//  Created by Richard Grundy on 11/16/14.
//  Copyright (c) 2014 Flomio, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NdefMessage.h"
#import "FmCustomTypes.h"
#import "TLVParser.h"

@class FmSessionManager;

@interface FmTag : NSObject

@property (nonatomic, strong) NSString *atr;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic) TagType type;
@property (nonatomic, strong) NSString *deviceUuid;

- (instancetype)initWithUuid:(NSString *)uuid andAtr:(NSString *)atr andType:(TagType)type;
- (NSString *)getCommandApduAfter:(NSString *)previousCommand;
- (void)sendApdu:(NSString *)apdu success:(void (^)(NSString *))completionBlock;
- (void)writeNdef:(NdefMessage *)ndef success:(void (^)(BOOL))completionBlock;
- (void)readNdef:(void (^)(NdefMessage *))completionBlock;
- (void)parseResponseData:(NSData *)data success:(void (^)(NdefMessage *))completionBlock;
- (void)readPage:(int)page success:(void (^)(NSData *))completionBlock;

//Command Apdus
+ (NSString *)readBinaryCommandwithOffset:(NSString *)offset andLength:(NSString *)length;
+ (NSString *)getUuid;
+ (NSString *)writePage:(int)page withData:(NSData *)dataToWrite;

@end
