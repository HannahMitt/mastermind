//
//  MMMRowData.h
//  mastermind
//
//  Created by Hannah Mittelstaedt on 4/13/14.
//  Copyright (c) 2014 Mittens. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMMRowData : NSObject

- (void)setUIColor:(UIColor *)color forColumn:(int) column;
- (UIColor *)getUIColorforColumn:(int) column;
- (void)setAssesmentColor:(UIColor *)color forColumn:(int) column;
- (UIColor *)getAssesmentColorforColumn:(int) column;

@end
