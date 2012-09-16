//
//  SeatView.h
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Seat.h"

@interface SeatView : UIView

@property (nonatomic, retain) Seat *seat;

@property (nonatomic, retain) IBOutlet UIImageView *seatImg;

@end
