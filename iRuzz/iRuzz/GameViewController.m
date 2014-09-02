//
//  GameViewController.m
//  iRuzz
//
//  Created by cat on 2014/08/09.
//  Copyright (c) 2014年 cat. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.m_card == nil) {
        self.m_card = [[Card alloc] init];
    
        //debug
        [self.m_card check_deck];
        
        self.a_card1.text = @"xX";
        self.a_card2.text = @"xX";
        self.a_card3.text = [self.m_card getCardName:4];
        self.a_card4.text = [self.m_card getCardName:6];
        self.a_card5.text = [self.m_card getCardName:8];
        self.a_card6.text = [self.m_card getCardName:10];
        self.a_card7.text = @"xX";

        self.y_card1.text = [self.m_card getCardName:1];
        self.y_card2.text = [self.m_card getCardName:3];
        self.y_card3.text = [self.m_card getCardName:5];
        self.y_card4.text = [self.m_card getCardName:7];
        self.y_card5.text = [self.m_card getCardName:9];
        self.y_card6.text = [self.m_card getCardName:11];
        self.y_card7.text = [self.m_card getCardName:13];
        
        self.a_card4.hidden = YES;
        self.a_card5.hidden = YES;
        self.a_card6.hidden = YES;
        self.a_card7.hidden = YES;
        self.y_card4.hidden = YES;
        self.y_card5.hidden = YES;
        self.y_card6.hidden = YES;
        self.y_card7.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)call:(id)sender
{
    if (self.y_card4.hidden == YES) {
        self.y_card4.hidden = NO;
        self.a_card4.hidden = NO;
        return;
    };
    if (self.y_card5.hidden == YES) {
        self.y_card5.hidden = NO;
        self.a_card5.hidden = NO;
        return;
    };
    if (self.y_card6.hidden == YES) {
        self.y_card6.hidden = NO;
        self.a_card6.hidden = NO;
        return;
    };
    if (self.y_card7.hidden == YES) {
        self.y_card7.hidden = NO;
        self.a_card7.hidden = NO;
        return;
    };
}


@end
