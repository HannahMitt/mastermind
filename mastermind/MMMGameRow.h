//
//  MMMGameRow.h
//  mastermind
//
//  Created by Hannah Mittelstaedt on 4/13/14.
//  Copyright (c) 2014 Mittens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMMGameRow : UITableViewCell

@property (nonatomic, strong) UIView *dot1;
@property (nonatomic, strong) UIView *dot2;
@property (nonatomic, strong) UIView *dot3;
@property (nonatomic, strong) UIView *dot4;

@property (nonatomic, strong) UIButton *peg1;
@property (nonatomic, strong) UIButton *peg2;
@property (nonatomic, strong) UIButton *peg3;
@property (nonatomic, strong) UIButton *peg4;

@end
