//
//  Tag.h
//  SDK
//
//  Created by Richard Grundy on 11/16/14.
//  Copyright (c) 2014 Flomio, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FmNdefMessage.h"
#import "FmCustomTypes.h"
#import "TLV.h"

@class FmSession;

@interface FmTag : NSObject

@property (nonatomic, strong) NSString *atr;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic) TagType type;
@property (nonatomic, weak) FmSession *session;

- (instancetype)initWithUid:(NSString *)uid andAtr:(NSString *)atr andType:(TagType)type fromSession:(FmSession *)session;
- (void)sendApdu:(NSString *)apdu success:(void (^)(NSString *))completionBlock;
- (void)writeNdef:(FmNdefMessage *)ndef success:(void (^)(BOOL))completionBlock;
- (void)readNdef:(void (^)(FmNdefMessage *))completionBlock;

@end
