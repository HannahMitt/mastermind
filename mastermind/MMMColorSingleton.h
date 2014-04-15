//
//  MMMColorSingleton.h
//  mastermind
//
//  Created by Hannah Mittelstaedt on 4/15/14.
//  Copyright (c) 2014 Mittens. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMMColorSingleton : NSObject

+ (UIColor *) colorInstance;
+ (void) setColorInstance:(UIColor *) color;

@end
