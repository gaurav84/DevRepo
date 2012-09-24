//
//  SelectedSeat.m
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 24/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import "SelectedSeat.h"

@implementation SelectedSeat

-(id)init {
  if(self = [super init]) {
  }
  
  return self;
}

-(void)dealloc {
  [super dealloc];
  [self.selectedSeatRow release];
}

@end
