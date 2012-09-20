//
//  SeatSelectorView.h
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeatSelectorViewModel.h"
#import "Seat.h"
#import "SeatRow.h"

@protocol SeatSelectorViewDelegate <NSObject>
@optional
-(void)didTouchSeat:(SeatView *)seatView;
@end

@interface SeatSelectorView : UIView <UIScrollViewDelegate, SeatRowDelegate>

@property (nonatomic, retain) SeatSelectorViewModel *viewModel;
@property (nonatomic, retain) id<SeatSelectorViewDelegate> delegate;
@property (nonatomic, retain) IBOutlet UIScrollView *seatViewScroller;

-(void)update;

@end
