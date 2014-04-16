//
//  MMMGameDoneAlert.m
//  mastermind
//
//  Created by Hannah Mittelstaedt on 4/15/14.
//  Copyright (c) 2014 Mittens. All rights reserved.
//

#import "MMMGameDoneAlert.h"

static int const BUTTON_DIAMETER = 30;

@interface MMMGameDoneAlert()

@property (nonatomic, strong) UIButton *peg1;
@property (nonatomic, strong) UIButton *peg2;
@property (nonatomic, strong) UIButton *peg3;
@property (nonatomic, strong) UIButton *peg4;

@end

@implementation MMMGameDoneAlert

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    
    if (self)
    {
        CGRect rect = CGRectMake(0, 0, BUTTON_DIAMETER, BUTTON_DIAMETER);
        self.peg1 = [self pegMadeWithRect:rect];
        [self.window addSubview:self.peg1];
    }
    
    return self;
}

- (UIButton *)pegMadeWithRect:(CGRect) rect
{
    UIButton *peg = [[UIButton alloc] initWithFrame:rect];
    peg.backgroundColor = [UIColor redColor];
    peg.layer.cornerRadius = BUTTON_DIAMETER / 2.0;
    return peg;
}

@end
