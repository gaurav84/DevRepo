//
//  SeatRow.m
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import "SeatRow.h"
#import "SeatView.h"

@implementation SeatRow

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    [self awakeFromNib];
  }
  return self;
}

-(void)awakeFromNib {
  NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"SeatRow" owner:self options:nil];
  [self addSubview:[views objectAtIndex:0]];
}

-(void)addSeatsToRow {
  for(int i=0; i<[self.seats count]; i++) {
    // seatWidth to be fixed, hardcoding 10 as i am not sure wether this class can have reference to SeatSelectorViewModel
    int seatWidth = 384/10;
    SeatView *seatView = [[[SeatView alloc] initWithFrame:CGRectMake(seatWidth * i, 10, seatWidth, seatWidth)] autorelease];
    seatView.delegate = self;
    seatView.seat = [self.seats objectAtIndex:i];
    [self addSubview:seatView];
  }
}

-(void)removeAllSeatsFromRow {
  for (UIView *view in self.subviews) {
    [view removeFromSuperview];
  }
}

-(void)didTouchSeat:(SeatView *)seatView {
  [self.delegate didTouchSeat:seatView];
}

-(void)dealloc {
  [super dealloc];
  [self.seats release];
  [self.delegate release];
}

@end
