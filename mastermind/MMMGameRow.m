//
//  MMMGameRow.m
//  mastermind
//
//  Created by Hannah Mittelstaedt on 4/13/14.
//  Copyright (c) 2014 Mittens. All rights reserved.
//

#import "MMMGameRow.h"

static int const BUTTON_DIAMETER = 30;
static int const BUTTON_SPACING = 20;
static int const DOT_DIAMETER = 10;

@implementation MMMGameRow

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        CGRect dotRect = CGRectMake(20, 7, DOT_DIAMETER, DOT_DIAMETER);
        self.dot1 = [self dotMadeWithRect:dotRect];
        [self addSubview:self.dot1];
        
        dotRect.origin.y += 20;
        self.dot2 = [self dotMadeWithRect:dotRect];
        [self addSubview:self.dot2];
        
        CGRect dotRectRight = CGRectMake(40, 7, DOT_DIAMETER, DOT_DIAMETER);
        self.dot3 = [self dotMadeWithRect:dotRectRight];
        [self addSubview:self.dot3];
        
        dotRectRight.origin.y += 20;
        self.dot4 = [self dotMadeWithRect:dotRectRight];
        [self addSubview:self.dot4];
        
        CGRect pegRect = CGRectMake(86, 7, BUTTON_DIAMETER, BUTTON_DIAMETER);
        
        self.peg1 = [self pegMadeWithRect:pegRect];
        [self addSubview:self.peg1];
        
        pegRect.origin.x += BUTTON_DIAMETER + BUTTON_SPACING;
        self.peg2 = [self pegMadeWithRect:pegRect];
        [self addSubview:self.peg2];
        
        pegRect.origin.x += BUTTON_DIAMETER + BUTTON_SPACING;
        self.peg3 = [self pegMadeWithRect:pegRect];
        [self addSubview:self.peg3];
        
        pegRect.origin.x += BUTTON_DIAMETER + BUTTON_SPACING;
        self.peg4 = [self pegMadeWithRect:pegRect];
        [self addSubview:self.peg4];
    }
    return self;
}

- (UIView *)dotMadeWithRect:(CGRect) rect
{
    UIView *dot = [[UIView alloc] initWithFrame:rect];
    dot.layer.cornerRadius = DOT_DIAMETER / 2.0;
    dot.layer.borderWidth = 1;
    dot.layer.borderColor = [UIColor whiteColor].CGColor;
    return dot;
}

- (UIButton *)pegMadeWithRect:(CGRect) rect
{
    UIButton *peg = [[UIButton alloc] initWithFrame:rect];
    peg.layer.cornerRadius = BUTTON_DIAMETER / 2.0;
    peg.layer.borderWidth = 2;
    peg.layer.borderColor = [UIColor whiteColor].CGColor;
    return peg;
}

@end