//
//  Card.h
//  iRuzz
//
//  Created by Ryou Inoue on 8/29/14.
//  Copyright (c) 2014 cat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

#define DECK_SIZE 52 /* 52枚 */
@property(strong, nonatomic, readwrite) NSMutableArray *deck; /* 52枚のデッキにする */

- (void) check_deck;
- (NSString *) getCardName:(NSInteger) atIndex;

@end
