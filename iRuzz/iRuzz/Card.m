//
//  Card.m
//  iRuzz
//
//  Created by Ryou Inoue on 8/29/14.
//  Copyright (c) 2014 cat. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.deck = [NSMutableArray array];
        
        int i;
        int d52[DECK_SIZE] = {0};
        
        for ( i = 0; i < DECK_SIZE; i++ ) {
            // 1から52までの一様乱数を発生させる */
            int n = arc4random_uniform(DECK_SIZE);
            NSLog(@"%2d回目 = %2d", i + 1, n);
            
            while (d52[n] != 0) {
                n++;
                if (n > DECK_SIZE) {
                    n = 0;
                }
            }
            [self.deck addObject:[NSNumber numberWithInt:n]];
            d52[n]=1;
        }
    }
    return self;
}

- (void) check_deck
{
    for (int i = 0; i < DECK_SIZE; i++) {
        NSNumber *n = [self.deck objectAtIndex:i];
        NSLog(@"%2@",n);
    }
}

/*
 * 0 - 12 : ♠A - ♠K
 * 13 - 25 : ♥A - ♥K
 * 26 - 38 : ♦A - ♦K
 * 39 - 51 : ♣A - ♣K
 */
- (NSString *) getCardName:(NSInteger) atIndex
{
    NSNumber *n = [self.deck objectAtIndex:atIndex];
    
    int m = n.intValue / 13;
    int num = n.intValue % 13 + 1; /* 0-12なので、+1して1-13にする */
    NSString *suit;
    switch (m) {
        case 0:
            suit = [NSString stringWithFormat:@"♠"];
            break;
        case 1:
            suit = [NSString stringWithFormat:@"♥"];
            break;
        case 2:
            suit = [NSString stringWithFormat:@"♦"];
            break;
        case 3:
            suit = [NSString stringWithFormat:@"♣"];
            break;
    }
    
    NSString *fig;
    if ((num >= 2) && (num <= 9)) {
        fig = [NSString stringWithFormat:@"%d", num];
    } else if (num == 1) {
        fig = @"A";
    } else if (num == 10) {
        fig = @"T";
    } else if (num == 11) {
        fig = @"J";
    } else if (num == 12) {
        fig = @"Q";
    } else if (num == 13) {
        fig = @"K";
    } else {
        assert("");
    }
    NSLog(@"%@%@",suit, fig);
    return [NSString stringWithFormat:@"%@%@", suit, fig];
}

@end
