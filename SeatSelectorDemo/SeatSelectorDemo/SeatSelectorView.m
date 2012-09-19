//
//  SeatSelectorView.m
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#define PADDING 10
#define SEAT_ROW_WIDTH 384
#define SEAT_ROW_HEIGHT 50

#import "SeatSelectorView.h"
#import "SeatRow.h"
#import "SeatBank.h"
#import "Seat.h"

@implementation SeatSelectorView

NSMutableArray *seatRowRef;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    [self awakeFromNib];
  }
  return self;
}

-(void)awakeFromNib {
  NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"SeatSelectorView" owner:self options:nil];
  [self addSubview:[views objectAtIndex:0]];
}

-(void)dealloc {
  [super dealloc];
  [seatRowRef release];
  [self.viewModel release];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

-(void)initScroller {
  self.seatViewScroller.delegate = self;
  self.seatViewScroller.contentSize = CGSizeMake(0, ceil((float)[[self viewModel] totalSeats]/[[self viewModel] seatsPerRow]) * (SEAT_ROW_HEIGHT + PADDING));
}

-(BOOL)ifScrollView:(UIScrollView *)scrollView containsView:(UIView *)view {
  if(CGRectIntersectsRect(scrollView.frame, view.frame)) {
    return YES;
  }
  else
    return NO;
}

-(void)update {
  [self initScroller];
  seatRowRef = [[NSMutableArray alloc] init];
  
  float rows = ceil((float)[[self viewModel] totalSeats]/[[self viewModel] seatsPerRow]);
  for(int i=0; i<rows; i++) {
    SeatRow *seatRow = [[SeatRow alloc] initWithFrame:CGRectMake(0, (SEAT_ROW_HEIGHT + PADDING) * i, SEAT_ROW_WIDTH, SEAT_ROW_HEIGHT)];
    [self.seatViewScroller addSubview:seatRow];
    
    [seatRowRef addObject:seatRow];
    if(seatRow.seats == nil && [self ifScrollView:self.seatViewScroller containsView:seatRow]) {
      seatRow.seats = [SeatBank getSeats:self.viewModel.seatsPerRow];
      [seatRow addSeatsToRow];
    }
  }
}

-(SeatRow *)seatRowWithSeatsLeavingView {
  SeatRow *result = nil;
  for(int i=0; i<[seatRowRef count]; i++) {
    SeatRow *seatRow = [seatRowRef objectAtIndex:i];
    if(!CGRectIntersectsRect(self.seatViewScroller.bounds, seatRow.frame)) {
      if([seatRow.seats count] > 0)
        result = seatRow;
    }
  }
  
  return result;
}

-(SeatRow *)seatRowToGetSeatsEnteringView {
  SeatRow *result = nil;
  for(int i=0; i<[seatRowRef count]; i++) {
    SeatRow *seatRow = [seatRowRef objectAtIndex:i];
    if(CGRectIntersectsRect(self.seatViewScroller.bounds, seatRow.frame)) {
      if([seatRow.seats count] < self.viewModel.seatsPerRow) {
        result = seatRow;
      }
    }
    
  }
  return result;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
  [self getSeatsForNextVisibleRow];
  [self storeSeatsForRowsOutsideView];
}

-(void)getSeatsForNextVisibleRow {
  SeatRow *nextVisibleSeatRow = [self seatRowToGetSeatsEnteringView];
  nextVisibleSeatRow.seats = [SeatBank getSeats:self.viewModel.seatsPerRow];
  [nextVisibleSeatRow addSeatsToRow];
}

-(void)storeSeatsForRowsOutsideView {
  SeatRow *seatRowLeavingVisibleArea = [self seatRowWithSeatsLeavingView];
  [SeatBank storeSeats:seatRowLeavingVisibleArea.seats];
  [seatRowLeavingVisibleArea.seats removeAllObjects];
  seatRowLeavingVisibleArea.seats = nil;
  [seatRowLeavingVisibleArea removeAllSeatsFromRow];
}

@end
