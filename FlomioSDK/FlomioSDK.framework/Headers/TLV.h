//
//  TLVParser.h
//  SDK
//
//  Created by Scott Condron on 22/02/2018.
//  Copyright © 2018 Flomio, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLV : NSObject
+ (int)getLength:(NSData *)firstPage;

+ (NSData *)prependTLV:(NSData *)bytes;

@end
