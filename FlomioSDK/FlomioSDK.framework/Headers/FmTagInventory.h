//
//  FmTagInventory.h
//  SDK
//
//  Created by Scott Condron on 29/12/2016.
//  Copyright © 2016 Flomio, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FmTag.h"
#import "FmType2Tag.h"
#import "FmType4Tag.h"

@protocol FmTagInventoryDelegate <NSObject>

- (void)inventoryDidAddTag:(FmTag *)tag;
- (void)inventoryDidUpdateTag:(FmTag *)tag;
- (void)inventoryDidRemoveTagWithUid:(NSString *)uid;

@end

@interface FmTagInventory : NSObject

@property (nonatomic, strong) NSMutableDictionary *tags;
@property (nonatomic, weak) id<FmTagInventoryDelegate> delegate;

- (void)addTag:(FmTag *)tag;
- (void)removeTagWithUid:(NSString *)uid;
- (FmTag *)tagWithUid:(NSString *)uid;

@end
