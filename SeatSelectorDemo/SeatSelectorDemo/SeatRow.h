//
//  SeatRow.h
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeatView.h"

@protocol SeatRowDelegate <NSObject>
@optional
-(void)didTouchSeat:(SeatView *)seatView;
@end

@interface SeatRow : UIView <SeatViewDelegate>

@property (nonatomic, retain) NSMutableArray *seats;
@property (nonatomic, retain) id<SeatRowDelegate> delegate;

-(void)addSeatsToRow;
-(void)removeAllSeatsFromRow;

@end
