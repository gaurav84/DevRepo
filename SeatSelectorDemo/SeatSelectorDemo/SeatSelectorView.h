//
//  SeatSelectorView.h
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeatSelectorViewModel.h"

@interface SeatSelectorView : UIView

@property (nonatomic, retain) SeatSelectorViewModel *viewModel;

@property (nonatomic, retain) IBOutlet UIScrollView *seatViewScroller;

-(void)update;

@end
