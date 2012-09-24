//
//  SeatBank.h
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SeatBank : NSObject

@property (nonatomic, retain) NSMutableArray *seats;

+(NSMutableArray *)getSeats:(int)count;
+(void)storeSeats:(NSMutableArray *)seats;

@end
