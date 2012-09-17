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

NSMutableArray *seatsToBeStored;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    [self awakeFromNib];
    seatsToBeStored = [[[NSMutableArray alloc] init] autorelease];
  }
  return self;
}

-(void)awakeFromNib {
  NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"SeatSelectorView" owner:self options:nil];
  [self addSubview:[views objectAtIndex:0]];
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
  self.seatViewScroller.contentSize = CGSizeMake(0, (int)ceil(self.viewModel.totalSeats/self.viewModel.seatsPerRow) * SEAT_ROW_HEIGHT);
}

-(BOOL)ifScrollView:(UIScrollView *)scrollView containsView:(UIView *)view {
  if(CGRectContainsRect(scrollView.frame, view.frame)) {
    return YES;
  }
  else
    return NO;
}

-(void)update {
  [self initScroller];
  int rows = (int)ceil(self.viewModel.totalSeats/self.viewModel.seatsPerRow);
  for(int i=0; i<rows; i++) {
    SeatRow *seatRow = [[SeatRow alloc] initWithFrame:CGRectMake(0, (SEAT_ROW_HEIGHT + PADDING) * i, SEAT_ROW_WIDTH, SEAT_ROW_HEIGHT)];
    [self.seatViewScroller addSubview:seatRow];
    
    if(seatRow.seats == nil && [self ifScrollView:self.seatViewScroller containsView:seatRow]) {
      seatRow.seats = [SeatBank getSeats:self.viewModel.seatsPerRow];
      [seatRow addSeats];
    }
  }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
  for(int i=0; i<[[self.seatViewScroller subviews] count]; i++) {
    UIView *view = [[self.seatViewScroller subviews] objectAtIndex:i];
    if([view isKindOfClass:[SeatRow class]]) {
      SeatRow *seatRow = [[self.seatViewScroller subviews] objectAtIndex:i];
      if(![self ifScrollView:self.seatViewScroller containsView:seatRow]) {
        // get seats from bank
      }
      else {
        
      }
    }
  }
}

@end
