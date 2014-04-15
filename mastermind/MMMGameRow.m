//
//  MMMGameRow.m
//  mastermind
//
//  Created by Hannah Mittelstaedt on 4/13/14.
//  Copyright (c) 2014 Mittens. All rights reserved.
//

#import "MMMGameRow.h"
#import "MMMRowData.h"
#import "MMMColorSingleton.h"

static int const BUTTON_DIAMETER = 30;
static int const BUTTON_SPACING = 20;
static int const DOT_DIAMETER = 10;

@interface MMMGameRow()

@property (nonatomic, strong) UIView *dot1;
@property (nonatomic, strong) UIView *dot2;
@property (nonatomic, strong) UIView *dot3;
@property (nonatomic, strong) UIView *dot4;

@property (nonatomic, strong) UIButton *peg1;
@property (nonatomic, strong) UIButton *peg2;
@property (nonatomic, strong) UIButton *peg3;
@property (nonatomic, strong) UIButton *peg4;

@end

@implementation MMMGameRow

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.isEdittingRow = false;
        
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
        [self.peg1 addTarget:self action:@selector(pegPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.peg1];
        
        pegRect.origin.x += BUTTON_DIAMETER + BUTTON_SPACING;
        self.peg2 = [self pegMadeWithRect:pegRect];
        [self.peg2 addTarget:self action:@selector(pegPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.peg2];
        
        pegRect.origin.x += BUTTON_DIAMETER + BUTTON_SPACING;
        self.peg3 = [self pegMadeWithRect:pegRect];
        [self.peg3 addTarget:self action:@selector(pegPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.peg3];
        
        pegRect.origin.x += BUTTON_DIAMETER + BUTTON_SPACING;
        self.peg4 = [self pegMadeWithRect:pegRect];
        [self.peg4 addTarget:self action:@selector(pegPressed:) forControlEvents:UIControlEventTouchUpInside];
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

- (void)setRowData:(MMMRowData *)rowData
{
    _rowData = rowData;
    self.peg1.backgroundColor = [self.rowData getUIColorforColumn:0];
    self.peg2.backgroundColor = [self.rowData getUIColorforColumn:1];
    self.peg3.backgroundColor = [self.rowData getUIColorforColumn:2];
    self.peg4.backgroundColor = [self.rowData getUIColorforColumn:3];
    
    self.dot1.backgroundColor = [self.rowData getAssesmentColorforColumn:0];
    self.dot2.backgroundColor = [self.rowData getAssesmentColorforColumn:1];
    self.dot3.backgroundColor = [self.rowData getAssesmentColorforColumn:2];
    self.dot4.backgroundColor = [self.rowData getAssesmentColorforColumn:3];
}

- (void)setIsEdittingRow:(BOOL)isEdittingRow
{
    _isEdittingRow = isEdittingRow;
    
    if (self.isEdittingRow){
        self.backgroundColor = [UIColor lightGrayColor];
    } else {
        self.backgroundColor = [UIColor clearColor];
    }
}

- (void)pegPressed:(UIButton *)button
{
    if(self.rowData && self.isEdittingRow){
        button.backgroundColor = [MMMColorSingleton colorInstance];
        
        int column;
        if (button == self.peg1) column = 0;
        else if (button == self.peg2) column = 1;
        else if (button == self.peg3) column = 2;
        else column = 3;
        
        [self.rowData setUIColor:[MMMColorSingleton colorInstance] forColumn:column];
    }
}

@end