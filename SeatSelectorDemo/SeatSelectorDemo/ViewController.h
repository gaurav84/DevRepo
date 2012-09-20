//
//  ViewController.h
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeatSelectorView.h"

@interface ViewController : UIViewController <SeatSelectorViewDelegate>

@property (nonatomic, retain) id<SeatSelectorViewDelegate> delegate;

@end
