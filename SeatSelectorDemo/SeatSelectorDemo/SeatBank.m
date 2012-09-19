//
//  SeatBank.m
//  SeatSelectorDemo
//
//  Created by Gaurav Srivastava on 16/09/12.
//  Copyright (c) 2012 Gaurav Srivastava. All rights reserved.
//

#import "SeatBank.h"
#import "Seat.h"

static SeatBank *seatBank = nil;

@implementation SeatBank

+(SeatBank *)instance {
    
    if(!seatBank) {
        seatBank = [[SeatBank alloc] init];
        [SeatBank instance].seats = [[[NSMutableArray alloc] init] autorelease];
    }
    return seatBank;
}

+(NSMutableArray *)getSeats:(int)count {
    NSMutableArray *seats = [[[NSMutableArray alloc] initWithCapacity:count] autorelease];
    
    if([[SeatBank instance].seats count] == 0) {
        for(int i=0; i<count; i++) {
            Seat *seat = [[[Seat alloc] init] autorelease];
            [seats addObject:seat];
        }
    }
    else {
        seats = [SeatBank instance].seats;
        [[SeatBank instance].seats removeAllObjects];
    }
    [self totalSeats];
    return seats;
}

+(void)storeSeats:(NSMutableArray *)seats {
    for(int i=0; i<[seats count]; i++) {
        if(![[SeatBank instance].seats containsObject:[seats objectAtIndex:i]]) {
            [[SeatBank instance].seats addObject:[seats objectAtIndex:i]];
        }
    }
    [self totalSeats];
}

+(void)totalSeats {
    NSLog(@"Total Seats in SeatBank: %d", [[SeatBank instance].seats count]);
}

-(void)dealloc {
    [super dealloc];
    [self.seats release];
}

@end
