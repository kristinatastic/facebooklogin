//
//  NotificationsViewController.m
//  facebooklogin
//
//  Created by Kristina Varshavskaya on 6/23/14.
//  Copyright (c) 2014 kristinatastic. All rights reserved.
//

#import "NotificationsViewController.h"
#import "UIColor+Hex.h"

@interface NotificationsViewController ()

@end

@implementation NotificationsViewController

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
    
    self.navigationItem.title = @"Notifications";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:0x3b5998];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
