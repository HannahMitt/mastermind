//
//  MMMGameDoneAlert.h
//  mastermind
//
//  Created by Hannah Mittelstaedt on 4/15/14.
//  Copyright (c) 2014 Mittens. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMMRowData;
@interface MMMGameDoneAlert : UIAlertView

@property (nonatomic, strong) MMMRowData *solution;

@end
