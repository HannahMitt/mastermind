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

static int const BUTTON_DIAMETER = 30;

@interface MMMGameTable ()

@property (nonatomic, strong) UIButton *redButton;
@property (nonatomic, strong) UIButton *blueButton;
@property (nonatomic, strong) UIButton *greenButton;
@property (nonatomic, strong) UIButton *blackButton;
@property (nonatomic, strong) UIButton *whiteButton;
@property (nonatomic, strong) UIButton *yellowButton;

@property (nonatomic, strong) UIColor *currentColor;
@property (nonatomic, strong) NSMutableArray *gameRows;

@end

@implementation MMMGameTable

- (id)init {
    self = [super init];
    if (self){
        self.gameRows = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i++)
        {
            [self.gameRows addObject:[[MMMRowData alloc] init]];
        }
        
        self.currentColor = [UIColor grayColor];
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
    
    return self;
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
    
    int buttonStart = self.view.frame.size.width / 7;
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
    self.currentColor = [UIColor colorWithCGColor:button.layer.backgroundColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.gameRows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MMMGameRow *row = [self.tableView dequeueReusableCellWithIdentifier:@"GameRow" forIndexPath:indexPath];
    row.rowData = self.gameRows[indexPath.row];
    return row;
}

@end
