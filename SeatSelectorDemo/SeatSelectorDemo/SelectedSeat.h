//
//  SelectedSeat.h
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 24/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SeatRow.h"

@class SeatRow;

@interface SelectedSeat : NSObject

@property (nonatomic) CGRect selectedSeatViewFrame;
@property (nonatomic, assign) SeatRow *selectedSeatRow;

@end
