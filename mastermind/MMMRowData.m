//
//  MMMRowData.m
//  mastermind
//
//  Created by Hannah Mittelstaedt on 4/13/14.
//  Copyright (c) 2014 Mittens. All rights reserved.
//

#import "MMMRowData.h"

@interface MMMRowData()
@property (nonatomic, strong) NSMutableArray *pegs;
@end

@implementation MMMRowData

- (id)init{
    self = [super init];
    if (self){
        self.pegs = [[NSMutableArray alloc] initWithArray:@[[UIColor grayColor], [UIColor grayColor], [UIColor grayColor], [UIColor grayColor]]];
    }
    return self;
}

- (void)setUIColor:(UIColor *)color forColumn:(int)column
{
    self.pegs[column] = color;
}

- (UIColor *)getUIColorforColumn:(int)column
{
    return self.pegs[column];
}

@end
