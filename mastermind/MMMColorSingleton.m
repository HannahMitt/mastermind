//
//  MMMColorSingleton.m
//  mastermind
//
//  Created by Hannah Mittelstaedt on 4/15/14.
//  Copyright (c) 2014 Mittens. All rights reserved.
//

#import "MMMColorSingleton.h"

@interface MMMColorSingleton()

@property (nonatomic, strong) UIColor *color;

@end

@implementation MMMColorSingleton

static MMMColorSingleton *sharedColor;

+ (UIColor *)colorInstance
{
    if (sharedColor == nil){
        sharedColor = [[super alloc] init];
    }
    
    return sharedColor.color;
}

+ (void)setColorInstance:(UIColor *)color
{
    if (sharedColor == nil){
        sharedColor = [[super alloc] init];
    }
    
    sharedColor.color = color;
}

- (id)init
{
    self = [super init];
    if (self){
        self.color = [UIColor grayColor];
    }
    return self;
}

@end
