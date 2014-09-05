//
//  RuzzHand.m
//  iRuzz
//
//  Created by Ryou Inoue on 9/4/14.
//  Copyright (c) 2014 cat. All rights reserved.
//

#import "RuzzHand.h"

@interface RuzzHand ()
{
}
@end

@implementation RuzzHand

/*
 * @retval    0     HandAの勝ち
 * @retval    1     HandBの勝ち
 * @retval    2     引き分け
 */
- (NSInteger) judgeHandA:(int *)handA HandB:(int *)handB
{
    const NSInteger hp7ToHp5[] = {HP5_0P, HP5_0P, HP5_0P, HP5_0P, HP5_1P, HP5_1P, HP5_1P, HP5_2P, HP5_2P, HP5_2P, HP5_FH};
    
    NSInteger hp7_handA = [self checkHP7:handA];
    NSInteger hp7_handB = [self checkHP7:handB];
    
    NSInteger hp5_handA = hp7ToHp5[hp7_handA];
    NSInteger hp5_handB = hp7ToHp5[hp7_handB];
    
    if (hp5_handA > hp5_handB) {
        return 1;
    } else if (hp5_handA < hp5_handB) {
        return 0;
    } else { /* 引き分けなグループ */
        return 2;
    }
    
    return 0;
}

/*
 * @return HP7
 */
- (NSInteger) checkHP7:(int *)hand
{
    NSInteger pairCounter = [self countPair_HP7:hand];
    NSInteger threeKCounter = [self count3K_HP7:hand];
    NSInteger fourKCounter = [self count4K_HP7:hand];
    
    const NSInteger One4K[2][2] = {{HP7_4K, HP7_4K1P}, {HP7_4K3K, -1}};
    const NSInteger No4K[3][4] = {{HP7_0P, HP7_1P, HP7_2P, HP7_3P}, { HP7_3K, HP7_3K1P, HP7_3K2P, -1}, { HP7_3K3K, -1, -1, -1}};
    
    if (fourKCounter == 1) {
        return One4K[threeKCounter][pairCounter];
    } else {
        return No4K[threeKCounter][pairCounter];
    }
}

/*
 * @return HP5
 */
- (NSInteger) checkHP5:(int *)hand
{
    return 0;
}

- (NSInteger) countPair_HP7:(int *)hand
{
    NSInteger pairCounter = 0;
    NSInteger threeKCounter = [self count3K_HP7:hand];
    NSInteger fourKCounter = [self count4K_HP7:hand];

    for (int i = 0; i < 5; i++) {
        if (hand[i] == hand[i + 1]) {
            pairCounter++;
        }
    }
    
    return (pairCounter - (threeKCounter * 2) - (fourKCounter * 3));
}

- (NSInteger) count3K_HP7:(int *)hand
{
    NSInteger threeKCounter = 0;
    NSInteger fourKCounter = [self count4K_HP7:hand];
    for (int i = 0; i < 4; i++) {
        if ( (hand[i] == hand[i + 1]) && (hand[i] == hand[i + 2])) {
            threeKCounter++;
        }
    }
    
    return (threeKCounter - (fourKCounter * 2));
}

- (NSInteger) count4K_HP7:(int *)hand
{
    NSInteger fourKCounter = 0;
    for (int i = 0; i < 3; i++) {
        if ( (hand[i] == hand[i + 1]) && (hand[i] == hand[i + 2]) && (hand[i] == hand[i + 3])) {
            fourKCounter++;
        }
    }

    return fourKCounter;
}

/*
 * @param HP5 要素5のint配列
 * @param HP7 要素7のint配列
 * @param hp7 HandPattern7の種類
 */
- (void) getHand5:(int *)hand5 Hand7:(int *)hand7 HP7:(NSUInteger)hp7
{
    switch (hp7) {
        case HP7_0P:
            [self getHand5HP7_0P:hand5 Hand7:hand7];
            break;
        case HP7_1P:
            [self getHand5HP7_1P:hand5 Hand7:hand7];
            break;
        case HP7_2P:
            [self getHand5HP7_2P:hand5 Hand7:hand7];
            break;
        case HP7_3K:
            [self getHand5HP7_3K:hand5 Hand7:hand7];
            break;
        case HP7_3P:
            [self getHand5HP7_3P:hand5 Hand7:hand7];
            break;
        case HP7_3K1P:
            [self getHand5HP7_3K1P:hand5 Hand7:hand7];
            break;
        case HP7_4K:
            [self getHand5HP7_4K:hand5 Hand7:hand7];
            break;
        case HP7_3K2P:
            [self getHand5HP7_3K2P:hand5 Hand7:hand7];
            break;
        case HP7_3K3K:
            [self getHand5HP7_3K3K:hand5 Hand7:hand7];
            break;
        case HP7_4K1P:
            [self getHand5HP7_4K1P:hand5 Hand7:hand7];
            break;
        case HP7_4K3K:
            [self getHand5HP7_4K3K:hand5 Hand7:hand7];
            break;
        default:
            assert("");
            break;
    }
}

-(void) getHand5HP7_0P:(int *)hand5 Hand7:(int *)hand7
{
    for (int i = 0; i < 5; i++) {
        hand5[i] = hand7[i];
    }
}

-(void) getHand5HP7_1P:(int *)hand5 Hand7:(int *)hand7
{
    int hand7cp[7];
    memcpy(hand7cp, hand7, sizeof(int)*7);
    
}

-(void) getHand5HP7_2P:(int *)hand5 Hand7:(int *)hand7
{
    
}

-(void) getHand5HP7_3K:(int *)hand5 Hand7:(int *)hand7
{
    
}

-(void) getHand5HP7_3P:(int *)hand5 Hand7:(int *)hand7
{
    
}

-(void) getHand5HP7_3K1P:(int *)hand5 Hand7:(int *)hand7
{
    
}

-(void) getHand5HP7_4K:(int *)hand5 Hand7:(int *)hand7
{
    
}

-(void) getHand5HP7_3K2P:(int *)hand5 Hand7:(int *)hand7
{
    
}

-(void) getHand5HP7_3K3K:(int *)hand5 Hand7:(int *)hand7
{
    
}

-(void) getHand5HP7_4K1P:(int *)hand5 Hand7:(int *)hand7
{
    
}

-(void) getHand5HP7_4K3K:(int *)hand5 Hand7:(int *)hand7
{
    
}

@end
