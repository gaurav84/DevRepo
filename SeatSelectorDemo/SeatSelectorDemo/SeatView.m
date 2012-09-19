//
//  SeatView.m
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import "SeatView.h"

@implementation SeatView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

-(void)awakeFromNib {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"SeatView" owner:self options:nil];
    [self addSubview:[views objectAtIndex:0]];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSString *message = [NSString stringWithFormat:@"%p", self];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Seat Touched" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
    [alert release];
}


@end
