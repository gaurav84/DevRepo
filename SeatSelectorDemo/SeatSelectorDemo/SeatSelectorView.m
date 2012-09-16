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

@implementation SeatSelectorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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

-(void)initScroller {
    self.seatViewScroller.delegate = self;
    self.seatViewScroller.contentSize = CGSizeMake(0, (int)ceil(self.viewModel.totalSeats/self.viewModel.seatsPerRow) * SEAT_ROW_HEIGHT);
}

-(BOOL)ifScrollView:(UIScrollView *)scrollView containsView:(UIView *)view {
    if(CGRectIntersectsRect(scrollView.bounds, view.frame)) {
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

@end
