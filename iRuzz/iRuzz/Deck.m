//
//  Deck.m
//  iRuzz
//
//  Created by Ryou Inoue on 2014/09/24.
//  Copyright (c) 2014年 cat. All rights reserved.
//

#import "Deck.h"

#include <stdlib.h>

///* ソート関数 */
//int int_sort( const void * a , const void * b ) {
//    /* 引数はvoid*型と規定されているのでint型にcastする */
//    if( *( int * )a < *( int * )b ) {
//        return -1;
//    }
//    else
//        if( *( int * )a == *( int * )b ) {
//            return 0;
//        }
//    return 1;
//}


@implementation Deck

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
            //           NSLog(@"%2d回目 = %2d", i + 1, n);
            
            while (d52[n] != 0) {
                n++;
                if (n > DECK_SIZE) {
                    n = 0;
                }
            }
            [self.deck addObject:[[Card alloc] initWithCardNumber:n]];
            d52[n]=1;
        }
        
    }
    return self;
}

- (void) check_deck
{
    for (int i = 0; i < DECK_SIZE; i++) {
        Card *card = [self.deck objectAtIndex:i];
        NSLog(@"%2@", card.displayString);
    }
}

- (Card *) getCard:(NSInteger) atIndex
{
    return [self.deck objectAtIndex:atIndex];
}

/*
 @retval    0     HandAの勝ち
 @retval    1     HandBの勝ち
 @retval    2     引き分け
 @retval    -1    HandAとHandBの要素数が違う or ハンドが8枚以上ある
 
 handAの中身例 [@"A♥",@"2♦",@"K♠",@"J♦"]
 */
//- (NSInteger) judgeHandA:(NSArray *)handA HandB:(NSArray *)handB
//{
//    int handAOfR[HAND_SIZE] = {0};
//    int handBOfR[HAND_SIZE] = {0};
//    
//    // 要素数チェック
//    if (([handA count] != [handB count]) && ([handA count] <= HAND_SIZE)) {
//        return -1;
//    }
//    
//    int count = [handA count];
//    for (int i = 0; i < count; i++) {
//        handAOfR[i] = [self getRank:[handA objectAtIndex:i]];
//        handBOfR[i] = [self getRank:[handB objectAtIndex:i]];
//    }
//    NSLog(@"Before");
//    NSLog(@"handA=%2d,%2d,%2d,%2d,%2d,%2d,%2d\n", handAOfR[0], handAOfR[1], handAOfR[2], handAOfR[3], handAOfR[4], handAOfR[5], handAOfR[6]);
//    NSLog(@"handB=%2d,%2d,%2d,%2d,%2d,%2d,%2d\n", handBOfR[0], handBOfR[1], handBOfR[2], handBOfR[3], handBOfR[4], handBOfR[5], handBOfR[6]);
//    
//    /* クイックソート */
//    qsort( handAOfR, [handA count], sizeof(int), int_sort );
//    qsort( handBOfR, [handB count], sizeof(int), int_sort );
//    
//    handA = [handA sortedArrayUsingSelector:@selector(compare:)];
//    handB = [handB sortedArrayUsingSelector:@selector(compare:)];
//    NSLog(@"After");
//    NSLog(@"handA=%2d,%2d,%2d,%2d,%2d,%2d,%2d\n", handAOfR[0], handAOfR[1], handAOfR[2], handAOfR[3], handAOfR[4], handAOfR[5], handAOfR[6]);
//    NSLog(@"handB=%2d,%2d,%2d,%2d,%2d,%2d,%2d\n", handBOfR[0], handBOfR[1], handBOfR[2], handBOfR[3], handBOfR[4], handBOfR[5], handBOfR[6]);
//    
//    RuzzHand *rh = [[RuzzHand alloc] init];
//    return [rh judgeHandA:handAOfR HandB:handBOfR];
//}


@end
