//
//  SeatSelectorViewModel.m
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import "SeatSelectorViewModel.h"

@implementation SeatSelectorViewModel

-(id)init {
  if(self = [super init]) {
    self.selectedSeats = [[[NSMutableArray alloc] init] autorelease];
    self.padding = 10;
    self.seatRowHeight = 50;
    self.seatRowWidth = 384;
  }
  
  return self;
}

@end
