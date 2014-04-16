//
//  MMMGameDoneAlert.m
//  mastermind
//
//  Created by Hannah Mittelstaedt on 4/15/14.
//  Copyright (c) 2014 Mittens. All rights reserved.
//

#import "MMMGameDoneAlert.h"

@interface MMMGameDoneAlert()

@end

@implementation MMMGameDoneAlert

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    
    if (self)
    {
        //Apparently custom views can't be added to alerts in iOS 7
    }
    
    return self;
}

@end
