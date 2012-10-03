//
//  SeatRow.m
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import "SeatRow.h"
#import "SeatView.h"
#import "SelectedSeat.h"

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
    SeatView *seatView = [[[SeatView alloc] initWithFrame:CGRectMake(self.viewModel.seatWidth * i, 10, self.viewModel.seatWidth, self.viewModel.seatHeight)] autorelease];
    seatView.delegate = self;
    seatView.isSelected = [self isSeatSelected:seatView.frame];
    seatView.seat = [self.seats objectAtIndex:i];
    [self addSubview:seatView];
  }
}

-(BOOL)isSeatSelected:(CGRect)frame {
  for(int i=0; i<[self.viewModel.selectedSeats count]; i++) {
    CGRect selectedSeatViewFrame = [[self.viewModel.selectedSeats objectAtIndex:i] selectedSeatViewFrame];
    if(CGRectContainsRect(frame, selectedSeatViewFrame)) {
      return YES;
    }
  }
  
  return NO;
}

-(void)removeAllSeatsFromRow {
  for (UIView *view in self.subviews) {
    [view removeFromSuperview];
  }
}

-(void)didTouchSeat:(SelectedSeat *)selectedSeat {
  selectedSeat.selectedSeatRow = self;
  
  [self.delegate didTouchSeat:selectedSeat];
}

-(void)showSelectedSeatViews:(CGRect)seatViewFrame {
  for(int i=0; i<[[self subviews] count]; i++) {
    if([[[self subviews] objectAtIndex:i] isKindOfClass:[SeatView class]]) {
      SeatView *seatView = [[self subviews] objectAtIndex:i];
      [seatView showSelected:seatViewFrame];
    }
  }
}


-(void)dealloc {
  [super dealloc];
  [self.seats release];
  [self.delegate release];
}

@end
