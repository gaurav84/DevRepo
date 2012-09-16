//
//  ViewController.m
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import "ViewController.h"
#import "SeatSelectorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SeatSelectorView *seatSelectorView = [[SeatSelectorView alloc] initWithFrame:CGRectMake(0, 0, 384, 500)];
    seatSelectorView.viewModel = [self getStubModel];
    [seatSelectorView update];
    [self.view addSubview:seatSelectorView];
}

-(SeatSelectorViewModel *)getStubModel {
    SeatSelectorViewModel *viewModel = [[[SeatSelectorViewModel alloc] init] autorelease];
    viewModel.totalSeats = 100;
    viewModel.seatsPerRow = 10;
    
    return viewModel;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
