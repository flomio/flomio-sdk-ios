//
//  FmType4Tag.h
//  SDK
//
//  Created by Scott Condron on 03/01/2017.
//  Copyright © 2017 Flomio, Inc. All rights reserved.
//

#import "FmTag.h"

@interface FmType4Tag : FmTag

@property (nonatomic) int position;
@property (nonatomic) int maximumReadInt;
@property (nonatomic) int minimumReadInt;
@property (nonatomic) BOOL isReadingData;
@property (nonatomic) BOOL hasReadData;
@property (strong, nonatomic) NSString *currentApdu;
@property (strong, nonatomic) NSString *previousResponse;
@property (strong, nonatomic) NSString *fileId;
@property (strong, nonatomic) NSString *maximumRead;
@property (strong, nonatomic) NSString *minimumRead;
@property (strong, nonatomic) NSMutableData *fullResponse;

- (void)updateAfterResponse:(NSString *)response;
+ (NSString *)selectNdefTagApplication;
+ (NSString *)readCcFile;
+ (NSString *)getNdefFileId:(NSString *)previousResponse;
+ (NSString *)getMaximumReadLength:(NSString *)previousResponse;
+ (NSString *)getMinimumReadLength:(NSString *)previousResponse;

@end
