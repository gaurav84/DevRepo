//
//  SeatSelectorViewModel.h
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SeatSelectorViewModel : NSObject

@property (nonatomic) int totalSeats;
@property (nonatomic) int seatsPerRow;
@property (nonatomic) int padding;
@property (nonatomic) int seatWidth;
@property (nonatomic) int seatHeight;
@property (nonatomic) int seatRowWidth;
@property (nonatomic) int seatRowHeight;

@property (nonatomic, retain) NSMutableArray *selectedSeats;

@end
