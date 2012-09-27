//
//  SeatView.m
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import "SeatView.h"
#import "SelectedSeat.h"

@implementation SeatView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self awakeFromNib];
    self.isSelected = NO;
  }
  return self;
}

-(void)awakeFromNib {
  NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"SeatView" owner:self options:nil];
  [self addSubview:[views objectAtIndex:0]];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

  if(self.isSelected) {
    self.isSelected = NO;
    self.isSeatSelected.text = @"";
  }
  else {
    self.isSelected = YES;
    self.isSeatSelected.text = @"✔";
  }
  
  SelectedSeat *selectedSeat = [[[SelectedSeat alloc] init] autorelease];
  selectedSeat.isSelected = self.isSelected;
  selectedSeat.selectedSeatViewFrame = self.frame;
  [self.delegate didTouchSeat:selectedSeat];

}

-(void)showSelected:(CGRect)seatViewFrame {
  if(CGRectContainsRect(seatViewFrame, self.frame))
    self.isSeatSelected.text = @"✔";
}

-(void)dealloc {
  [super dealloc];
  [self.delegate release];
}

@end
