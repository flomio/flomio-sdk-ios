//
//  Analytics.h
//  FlomioSDK
//
//  Created by Scott Condron on 12/03/2018.
//  Copyright © 2018 Flomio, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Analytics : NSObject

+ (void)trackEventWithCategory:(NSString *)category andAction:(NSString *)action andLabel:(NSString *)label;

@end
