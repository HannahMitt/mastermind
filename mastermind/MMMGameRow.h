//
//  MMMGameRow.h
//  mastermind
//
//  Created by Hannah Mittelstaedt on 4/13/14.
//  Copyright (c) 2014 Mittens. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMMRowData;
@interface MMMGameRow : UITableViewCell

@property (nonatomic) BOOL isEdittingRow;
@property (nonatomic, strong) MMMRowData *rowData;

@end
