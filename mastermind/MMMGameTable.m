//
//  MMMGameTable.m
//  mastermind
//
//  Created by Hannah Mittelstaedt on 4/13/14.
//  Copyright (c) 2014 Mittens. All rights reserved.
//

#import "MMMGameTable.h"
#import "MMMGameRow.h"
#import "MMMRowData.h"
#import "MMMColorSingleton.h"

static int const BUTTON_DIAMETER = 30;
static int const GAME_ROWS = 10;
static int const PEG_NUM = 4;

@interface MMMGameTable ()

@property (nonatomic, strong) UIButton *redButton;
@property (nonatomic, strong) UIButton *blueButton;
@property (nonatomic, strong) UIButton *greenButton;
@property (nonatomic, strong) UIButton *blackButton;
@property (nonatomic, strong) UIButton *whiteButton;
@property (nonatomic, strong) UIButton *yellowButton;
@property (nonatomic, strong) UIButton *doneButton;

@property (nonatomic, strong) MMMRowData *solution;
@property (nonatomic, strong) NSMutableArray *gameRows;
@property (nonatomic) int currentEdittingRow;

@end

@implementation MMMGameTable

- (id)init {
    self = [super init];
    if (self){
        self.solution = [[MMMRowData alloc] init];
        for (int k = 0; k < PEG_NUM; k++) {
            [self.solution setUIColor:[self getRandomColor] forColumn:k];
        }
        
        
        self.gameRows = [[NSMutableArray alloc] init];
        for (int i = 0; i < GAME_ROWS; i++)
        {
            [self.gameRows addObject:[[MMMRowData alloc] init]];
        }
        
        self.currentEdittingRow = [self.gameRows count] - 1;
        
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (UIColor *)getRandomColor
{
    int colorInt = arc4random() % 6;
    if (colorInt == 0) {
        return [UIColor redColor];
    } else if (colorInt == 1) {
        return [UIColor blueColor];
    } else if (colorInt == 2) {
        return [UIColor greenColor];
    } else if (colorInt == 3) {
        return [UIColor blackColor];
    } else if (colorInt == 4) {
        return [UIColor whiteColor];
    } else {
        return [UIColor yellowColor];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int bottomRow = self.view.frame.size.height - BUTTON_DIAMETER - 10;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, bottomRow) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor grayColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[MMMGameRow class] forCellReuseIdentifier:@"GameRow"];
    
    int buttonStart = self.view.frame.size.width / 8;
    CGRect buttonRect = CGRectMake(buttonStart - (BUTTON_DIAMETER / 2.0), bottomRow + 5, BUTTON_DIAMETER, BUTTON_DIAMETER);
    
    self.redButton = [self makeButtonChooserWithRect:buttonRect forColor:[UIColor redColor]];
    [self.view addSubview:self.redButton];
    
    buttonRect.origin.x += buttonStart;
    self.blueButton = [self makeButtonChooserWithRect:buttonRect forColor:[UIColor blueColor]];
    [self.view addSubview:self.blueButton];
    
    buttonRect.origin.x += buttonStart;
    self.greenButton = [self makeButtonChooserWithRect:buttonRect forColor:[UIColor greenColor]];
    [self.view addSubview:self.greenButton];
    
    buttonRect.origin.x += buttonStart;
    self.blackButton = [self makeButtonChooserWithRect:buttonRect forColor:[UIColor blackColor]];
    [self.view addSubview:self.blackButton];
    
    buttonRect.origin.x += buttonStart;
    self.whiteButton = [self makeButtonChooserWithRect:buttonRect forColor:[UIColor whiteColor]];
    [self.view addSubview:self.whiteButton];
    
    buttonRect.origin.x += buttonStart;
    self.yellowButton = [self makeButtonChooserWithRect:buttonRect forColor:[UIColor yellowColor]];
    [self.view addSubview:self.yellowButton];
    
    [self.redButton addTarget:self action:@selector(colorButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.blueButton addTarget:self action:@selector(colorButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.greenButton addTarget:self action:@selector(colorButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.blackButton addTarget:self action:@selector(colorButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.whiteButton addTarget:self action:@selector(colorButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.yellowButton addTarget:self action:@selector(colorButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    buttonRect.origin.x += buttonStart;
    buttonRect.size.width = BUTTON_DIAMETER * 1.6;
    self.doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.doneButton setFrame:buttonRect];
    [self.doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [self.view addSubview:self.doneButton];
    [self.doneButton addTarget:self action:@selector(doneButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (UIButton *)makeButtonChooserWithRect:(CGRect)rect forColor:(UIColor *)color
{
    UIButton *redButton = [[UIButton alloc] initWithFrame:rect];
    redButton.backgroundColor = color;
    redButton.layer.cornerRadius = BUTTON_DIAMETER / 2.0;
    redButton.layer.borderWidth = 2;
    redButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    return redButton;
}

- (void)colorButtonPressed:(UIButton *)button
{
    self.redButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.blueButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.greenButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.blackButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.whiteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.yellowButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    button.layer.borderColor = [UIColor darkGrayColor].CGColor;
    [MMMColorSingleton setColorInstance:[UIColor colorWithCGColor:button.layer.backgroundColor]];
}

- (void)doneButtonPressed:(UIButton *)button
{
    MMMRowData *currentRow = self.gameRows[self.currentEdittingRow];
    for (int i = 0; i < PEG_NUM; i++)
    {
        if ([[currentRow getUIColorforColumn:i] isEqual:[UIColor grayColor]]){
            return;
        }
    }
    
    int currentAssesmentPeg = 0;
    NSMutableArray *usedPegs = [[NSMutableArray alloc] initWithArray:@[@(0), @(0), @(0), @(0)]];
    NSMutableArray *usedSolutionPegs = [[NSMutableArray alloc] initWithArray:@[@(0), @(0), @(0), @(0)]];
    
    for (int i = 0; i < PEG_NUM; i++)
    {
        if ([[currentRow getUIColorforColumn:i] isEqual:[self.solution getUIColorforColumn:i]]){
            [currentRow setAssesmentColor:[UIColor blackColor] forColumn:currentAssesmentPeg];
            currentAssesmentPeg++;
            usedPegs[i] = @(1);
            usedSolutionPegs[i] = @(1);
        }
    }
    
    for (int i = 0; i < PEG_NUM; i++)
    {
        for (int k = 0; k < PEG_NUM; k++)
        {
            if ([usedPegs[i] integerValue] == 0 && [usedSolutionPegs[k] integerValue] == 0 && ([[currentRow getUIColorforColumn:i] isEqual:[self.solution getUIColorforColumn:k]])){
                [currentRow setAssesmentColor:[UIColor whiteColor] forColumn:currentAssesmentPeg];
                currentAssesmentPeg++;
                usedPegs[i] = @(1);
                usedSolutionPegs[k] = @(1);
            }
        }
    }
    
    self.currentEdittingRow--;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.gameRows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MMMGameRow *row = [self.tableView dequeueReusableCellWithIdentifier:@"GameRow" forIndexPath:indexPath];
    row.selectionStyle = UITableViewCellSelectionStyleNone;
    row.rowData = self.gameRows[indexPath.row];
    row.isEdittingRow = (indexPath.row == self.currentEdittingRow);
    return row;
}

@end
