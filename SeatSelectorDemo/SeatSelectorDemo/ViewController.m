//
//  ViewController.m
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import "ViewController.h"
#import "SeatSelectorView.h"
#import "SelectedSeat.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  SeatSelectorView *seatSelectorView = [[[SeatSelectorView alloc] initWithFrame:CGRectMake(200, 200, 384, 600)] autorelease];
  seatSelectorView.delegate = self;
  seatSelectorView.viewModel = [self getStubModel];
  [seatSelectorView update];
  [self.view addSubview:seatSelectorView];
}

-(SeatSelectorViewModel *)getStubModel {
  self.viewModel = [[[SeatSelectorViewModel alloc] init] autorelease];
  self.viewModel.totalSeats = 200;
  self.viewModel.seatsPerRow = 10;
  
  return self.viewModel;
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

-(void)didTouchSeat:(SelectedSeat *)selectedSeat {
  //NSLog(@"%@", self.viewModel.selectedSeats);
}

-(void)dealloc {
  [super dealloc];
  [self.delegate release];
}

@end
