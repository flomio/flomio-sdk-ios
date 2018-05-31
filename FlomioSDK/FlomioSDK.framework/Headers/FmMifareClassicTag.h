//
//  FmMifareClassicTag.h
//  SDK
//
//  Created by Scott Condron on 23/04/2018.
//  Copyright © 2018 Flomio, Inc. All rights reserved.
//
#import "FmTag.h"

@interface FmMifareClassicTag : FmTag

@end

@interface CapabilityContainerMifareClassic: NSObject
@property(nonatomic, assign) int length;
@end
