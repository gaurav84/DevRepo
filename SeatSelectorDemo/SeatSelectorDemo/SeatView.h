//
//  SeatView.h
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Seat.h"

@class SeatView;

@protocol SeatViewDelegate <NSObject>
@optional
-(void)didTouchSeat:(SeatView *)seatView;
@end

@interface SeatView : UIView

@property (nonatomic, retain) Seat *seat;
@property (nonatomic) int isSelected;
@property (nonatomic, retain) IBOutlet UIImageView *seatImg;
@property (nonatomic, retain) id<SeatViewDelegate> delegate;
@property (nonatomic, retain) IBOutlet UILabel *isSeatSelected;

@end
