//
//  SeatView.h
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Seat.h"

@class SelectedSeat;

@protocol SeatViewDelegate <NSObject>
@optional
-(void)didTouchSeat:(SelectedSeat *)selectedSeat;
@end

@interface SeatView : UIView

@property (nonatomic, retain) Seat *seat;
@property (nonatomic, retain) IBOutlet UIImageView *seatImg;
@property (nonatomic, retain) id<SeatViewDelegate> delegate;
@property (nonatomic, retain) IBOutlet UILabel *isSeatSelected;
@property (nonatomic) BOOL isSelected;
@property (nonatomic) CGRect seatRowFrame;

-(void)showSelected:(CGRect)seatViewFrame;

@end
