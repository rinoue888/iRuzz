//
//  Card.m
//  iRuzz
//
//  Created by Ryou Inoue on 8/29/14.
//  Copyright (c) 2014 cat. All rights reserved.
//

#import "Card.h"

@interface Card()
// 自分自身の中では変更可能にする
@property (strong, readwrite) NSString *displayString;     ///< NSString.
@property (readwrite) NSInteger rank;  ///< localized value.
@property (readwrite) NSInteger suit;  ///< localized value.
@end


@implementation Card

/*
 * 0 - 12 : A♠ - K♠
 * 13 - 25 : A♥ - K♥
 * 26 - 38 : A♦ - K♦
 * 39 - 51 : A♣ - K♣
 */
- (id)initWithCardNumber:(NSInteger) number
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.suit = number / 13;
        self.rank = number % 13 + 1; /* 0-12なので、+1して1-13にする */

        NSString *suit = [self getCardSuit];
        
        NSString *rank;
        if ((self.rank >= 2) && (self.rank <= 9)) {
            rank = [NSString stringWithFormat:@"%d", self.rank];
        } else if (self.rank == 1) {
            rank = @"A";
        } else if (self.rank == 10) {
            rank = @"T";
        } else if (self.rank == 11) {
            rank = @"J";
        } else if (self.rank == 12) {
            rank = @"Q";
        } else if (self.rank == 13) {
            rank = @"K";
        } else {
            assert("");
        }
        self.displayString = [[rank stringByAppendingString:@"\n"] stringByAppendingString:suit];
    }
    return self;
}


/*
 * 0:♠
 * 1:♥
 * 2:♦
 * 3:♣
 */
- (NSString *) getCardSuit
{
    switch (self.suit) {
        case 0:
            return [NSString stringWithFormat:@"♠"];
        case 1:
            return [NSString stringWithFormat:@"♥"];
        case 2:
            return [NSString stringWithFormat:@"♦"];
        case 3:
            return [NSString stringWithFormat:@"♣"];
        default:
            assert("");
            break;
    }
    return @"";
}

@end
