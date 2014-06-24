//
//  FeedViewController.m
//  facebooklogin
//
//  Created by Kristina Varshavskaya on 6/19/14.
//  Copyright (c) 2014 kristinatastic. All rights reserved.
//

#import "FeedViewController.h"
#import "UIColor+Hex.h"

@interface FeedViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *feedView;
@property (weak, nonatomic) IBOutlet UIButton *onPostStatus;

- (void)loadFeed;
- (void)onSearchButton;
- (void)onMessagesListButton;

@end

@implementation FeedViewController

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
    
    [self.indicatorView startAnimating];
    
    self.navigationItem.title = @"News Feed";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:0x3b5998];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    UIImage *searchButtonImage = [[UIImage imageNamed:@"search"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithImage:searchButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onSearchButton)];
    self.navigationItem.leftBarButtonItem = searchButton;
    
    UIImage *messageslistButtonImage = [[UIImage imageNamed:@"messageslist"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *messageslistButton = [[UIBarButtonItem alloc] initWithImage:messageslistButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onMessagesListButton)];
    self.navigationItem.rightBarButtonItem = messageslistButton;
    
    self.scrollView.hidden = YES;
    
    self.scrollView.contentSize = CGSizeMake(320, self.feedView.frame.size.height);
    self.scrollView.delegate = self;
    
    [self performSelector:@selector(loadFeed) withObject:nil afterDelay:2];
    
}

- (void)onSearchButton {
    
}

- (void)onMessagesListButton {
    
}

- (void)loadFeed {
    [self.indicatorView stopAnimating];
    self.scrollView.hidden = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
