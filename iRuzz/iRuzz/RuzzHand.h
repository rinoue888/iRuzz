//
//  RuzzHand.h
//  iRuzz
//
//  Created by Ryou Inoue on 9/4/14.
//  Copyright (c) 2014 cat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuzzHand : NSObject

typedef NS_ENUM(NSUInteger, HP7) { /* HandPattern7 */
    HP7_0P,
    HP7_1P,
    HP7_2P,
    HP7_3K,
    HP7_3P,
    HP7_3K1P,
    HP7_4K,
    HP7_3K2P,
    HP7_3K3K,
    HP7_4K1P,
    HP7_4K3K
};

typedef NS_ENUM(NSUInteger, HP5) { /* HandPattern5 */
    HP5_0P,
    HP5_1P,
    HP5_2P,
    HP5_FH,
};

- (NSInteger) judgeHandA:(int *)handA HandB:(int *)handB;
- (NSInteger) checkHP7:(int *)hand;
- (NSInteger) checkHP5:(int *)hand;

@end
