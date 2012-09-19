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

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

-(void)awakeFromNib {
  NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"SeatRow" owner:self options:nil];
  [self addSubview:[views objectAtIndex:0]];
}

-(void)addSeatsToRow {
  for(int i=0; i<[self.seats count]; i++) {
    // seatWidth to be fixed, hardcoding 10 as i am not sure if this class can have reference to SeatSelectorViewModel
    int seatWidth = 384/10;
    SeatView *seatView = [[SeatView alloc] initWithFrame:CGRectMake(seatWidth * i, 5, seatWidth, seatWidth)];
    [self addSubview:seatView];
  }
}

-(void)removeAllSeatsFromRow {
  for (UIView *view in self.subviews) {
    [view removeFromSuperview];
  }
}

@end
