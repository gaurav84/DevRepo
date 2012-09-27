//
//  Seat.h
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Seat : NSObject

@property (nonatomic, retain) NSString *seatNumber;
@property (nonatomic) BOOL isSelected;
@property (nonatomic) BOOL isConfirmed;


@end
