//
//  SeatSelectorView.m
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import "SeatSelectorView.h"
#import "SeatRow.h"
#import "SeatBank.h"
#import "Seat.h"

@implementation SeatSelectorView

NSMutableArray *seatRowRef;
BOOL isSeatAlreadyPresent;

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

-(void)initScroller {
  self.seatViewScroller.delegate = self;
  self.seatViewScroller.contentSize = CGSizeMake(0, ceil((float)[[self viewModel] totalSeats]/[[self viewModel] seatsPerRow]) * (self.viewModel.seatRowHeight + self.viewModel.padding));
}

-(void)update {
  [self initScroller];
  seatRowRef = [[NSMutableArray alloc] init];
  isSeatAlreadyPresent = NO;
  
  float rows = ceil((float)[[self viewModel] totalSeats]/[[self viewModel] seatsPerRow]);
  for(int i=0; i<rows; i++) {
    SeatRow *seatRow = [[[SeatRow alloc] initWithFrame:CGRectMake(0, (self.viewModel.seatRowHeight + self.viewModel.padding) * i, self.viewModel.seatRowWidth, self.viewModel.seatRowHeight)] autorelease];
    seatRow.delegate = self;
    seatRow.viewModel = self.viewModel;
    [self.seatViewScroller addSubview:seatRow];
    
    [seatRowRef addObject:seatRow];
    if(seatRow.seats == nil && [self ifScrollView:self.seatViewScroller containsView:seatRow]) {
      seatRow.seats = [SeatBank getSeats:self.viewModel.seatsPerRow];
      [seatRow addSeatsToRow];
    }
  }
}

-(BOOL)ifScrollView:(UIScrollView *)scrollView containsView:(UIView *)view {
  if(CGRectIntersectsRect(scrollView.frame, view.frame)) {
    return YES;
  }
  else
    return NO;
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
  if(nextVisibleSeatRow) {
    nextVisibleSeatRow.seats = [SeatBank getSeats:self.viewModel.seatsPerRow];
    [nextVisibleSeatRow addSeatsToRow];
    
    [self showSelectedSeat];
  }
}

-(void)storeSeatsForRowsOutsideView {
  SeatRow *seatRowLeavingVisibleArea = [self seatRowWithSeatsLeavingView];
  if(seatRowLeavingVisibleArea) {
    [SeatBank storeSeats:seatRowLeavingVisibleArea.seats];
    [seatRowLeavingVisibleArea.seats removeAllObjects];
    seatRowLeavingVisibleArea.seats = nil;
    [seatRowLeavingVisibleArea removeAllSeatsFromRow];
  }
}

-(void)showSelectedSeat {
  for(int i=0; i<[self.viewModel.selectedSeats count]; i++) {
    SelectedSeat *selectedSeat = [self.viewModel.selectedSeats objectAtIndex:i];
    SeatRow *selectedSeatRow = selectedSeat.selectedSeatRow;
    [selectedSeatRow showSelectedSeatViews:selectedSeat.selectedSeatViewFrame];
  }
}

-(void)didTouchSeat:(SelectedSeat *)selectedSeat {
  [self.delegate didTouchSeat:selectedSeat];  
  [self addSeatToModel:selectedSeat];
}

-(void)addSeatToModel:(SelectedSeat *)seat {
  NSMutableArray *selectedSeatsArr = [self.viewModel.selectedSeats copy];
  
  if([self.viewModel.selectedSeats count] == 0) {
    [self.viewModel.selectedSeats addObject:seat];
    return;
  }
  else {
    for(int i=0; i<[selectedSeatsArr count]; i++) {
      SelectedSeat *selectedSeat = [selectedSeatsArr objectAtIndex:i];
      SeatRow *seatRow = selectedSeat.selectedSeatRow;
      CGRect seatViewFrame = selectedSeat.selectedSeatViewFrame;
      
      if([seat.selectedSeatRow isEqual:seatRow] && CGRectContainsRect(seatViewFrame, seat.selectedSeatViewFrame)) {
        isSeatAlreadyPresent = YES;
        [self.viewModel.selectedSeats removeObjectAtIndex:i];
        return;
      }
      else {
        isSeatAlreadyPresent = NO;
      }
    }
    
    if(!isSeatAlreadyPresent)
      [self.viewModel.selectedSeats addObject:seat];
  }
}

-(void)dealloc {
  [super dealloc];
  //[seatRowRef release];
  [self.viewModel release];
  [self.seatViewScroller release];
  [self.delegate release];
}

@end
