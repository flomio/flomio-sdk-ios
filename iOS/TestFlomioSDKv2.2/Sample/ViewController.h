//
//  ViewController.h
//  TestFlomioSDKv2.0
//
//  Created by Scott Condron on 05/07/2016.
//  Copyright © 2016 Scott Condron. All rights reserved.
//

#import "FmSessionManager.h"

@interface ViewController : UIViewController <FmSessionManagerDelegate> {
    FmSessionManager *readerManager;
}

- (IBAction)startPolling:(id)sender;
- (IBAction)stopPolling:(id)sender;

@end
