//
//  MoreViewController.m
//  facebooklogin
//
//  Created by Kristina Varshavskaya on 6/19/14.
//  Copyright (c) 2014 kristinatastic. All rights reserved.
//

#import "MoreViewController.h"
#import "UIColor+Hex.h"

@interface MoreViewController ()
@property (weak, nonatomic) IBOutlet UITableView *moreTable;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"More";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:0x3b5998];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    self.moreTable.dataSource = self;
    self.moreTable.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *meCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    meCell.textLabel.text = [NSString stringWithFormat:@"Kristina Varshavskaya"];
    
    return meCell;
    
    UITableViewCell *favoritesCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    favoritesCell.textLabel.text = [NSString stringWithFormat:@"Favorites", indexPath.row];
    
    return favoritesCell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
