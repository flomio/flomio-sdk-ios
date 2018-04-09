//
//  FmType4Tag.h
//  SDK
//
//  Created by Scott Condron on 03/01/2017.
//  Copyright © 2017 Flomio, Inc. All rights reserved.
//

#import "FmTag.h"

@interface FmType4Tag : FmTag

+ (NSString *)selectNdefTagApplication;
+ (NSString *)readCcFile;
+ (NSString *)getNdefFileId:(NSString *)previousResponse;
+ (NSString *)getMaximumReadLength:(NSString *)previousResponse;
+ (NSString *)getMinimumReadLength:(NSString *)previousResponse;

@end

@interface CapabilityContainerType4: NSObject
  @property (strong, nonatomic) NSString *maximumRead;
  @property (nonatomic) int maximumReadInt;
  @property (strong, nonatomic) NSString *minimumRead;
  @property (nonatomic) int minimumReadInt;
@end
