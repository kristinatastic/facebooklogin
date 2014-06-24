//
//  LoginViewController.m
//  facebooklogin
//
//  Created by Kristina Varshavskaya on 6/18/14.
//  Copyright (c) 2014 kristinatastic. All rights reserved.
//

#import "LoginViewController.h"
#import "FeedViewController.h"
#import "RequestsViewController.h"
#import "MessagesViewController.h"
#import "NotificationsViewController.h"
#import "MoreViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIImageView *form;
@property (weak, nonatomic) IBOutlet UIView *loginForm;
@property (nonatomic, assign) BOOL isKeyboardShown;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

- (IBAction)onEmailField:(id)sender;
- (IBAction)onPasswordField:(id)sender;
- (IBAction)onOutsideForm:(id)sender;
- (IBAction)onLoginButton:(id)sender;
- (IBAction)whileEditingEmail:(id)sender;
- (IBAction)whileEditingPassword:(id)sender;
- (void)loadFeedView;
- (void)checkPassword;

@end

@implementation LoginViewController

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
    
    self.isKeyboardShown = NO;
    self.loginButton.enabled = NO;
    [self.indicatorView stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onEmailField:(id)sender {
    //self.loginButton.enabled = NO;
    if (self.isKeyboardShown == NO) {
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^ {
            self.loginForm.frame = CGRectMake(self.loginForm.frame.origin.x, self.loginForm.frame.origin.y - 90, self.loginForm.frame.size.width, self.loginForm.frame.size.height);
            
            self.signUpButton.frame = CGRectMake(self.signUpButton.frame.origin.x, self.signUpButton.frame.origin.y - 140, self.signUpButton.frame.size.width, self.signUpButton.frame.size.height);
        }completion:nil];
        
        self.isKeyboardShown = YES;
    }
}

- (IBAction)onPasswordField:(id)sender {
    self.loginButton.enabled = NO;
    if (self.isKeyboardShown == NO) {
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^ {
            self.loginForm.frame = CGRectMake(self.loginForm.frame.origin.x, self.loginForm.frame.origin.y - 90, self.loginForm.frame.size.width, self.loginForm.frame.size.height);
            
            self.signUpButton.frame = CGRectMake(self.signUpButton.frame.origin.x, self.signUpButton.frame.origin.y - 140, self.signUpButton.frame.size.width, self.signUpButton.frame.size.height);
        }completion:nil];
        
        self.isKeyboardShown = YES;
    }
}

- (IBAction)onOutsideForm:(id)sender {
    if (self.isKeyboardShown == YES) {
        [self.view endEditing:YES];
        
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^ {
            self.loginForm.frame = CGRectMake(self.loginForm.frame.origin.x, self.loginForm.frame.origin.y + 90, self.loginForm.frame.size.width, self.loginForm.frame.size.height);
            
            self.signUpButton.frame = CGRectMake(self.signUpButton.frame.origin.x, self.signUpButton.frame.origin.y + 140, self.signUpButton.frame.size.width, self.signUpButton.frame.size.height);
        }completion:nil];
        self.isKeyboardShown = NO;
    }
    self.isKeyboardShown = NO;
    [self.view endEditing:YES];
}

- (IBAction)whileEditingEmail:(id)sender {
    if (![self.emailField.text isEqual:@""] && ![self.passwordField.text isEqual:@""]) {
        self.loginButton.enabled = YES;
        
    } else if ([self.emailField.text isEqual:@""] || [self.passwordField.text isEqual:@""]) {
        self.loginButton.enabled = NO;
    }
}

- (IBAction)whileEditingPassword:(id)sender {
    if (![self.emailField.text isEqual:@""] && ![self.passwordField.text isEqual:@""]) {
        self.loginButton.enabled = YES;
        
    } else if ([self.emailField.text isEqual:@""] || [self.passwordField.text isEqual:@""]) {
        self.loginButton.enabled = NO;
    }
}

- (IBAction)onLoginButton:(id)sender {
    [sender setSelected:YES];
    
    [self.indicatorView startAnimating];
    
    if ([self.emailField.text isEqual:@"kristina"] && [self.passwordField.text isEqual:@"password"]) {
        [self performSelector:@selector(loadFeedView) withObject:nil afterDelay:2];
        self.loginButton.enabled = YES;
        
    } else if (![self.emailField.text isEqual:@"kristina"] || ![self.passwordField.text isEqual:@"password"]) {
        [self performSelector:@selector(checkPassword) withObject:nil afterDelay:2];
    }
}

- (void)checkPassword {
    [self.loginButton setSelected:NO];
    [self.indicatorView stopAnimating];
    UIAlertView *loginWrongAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your email or password is incorrect." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Got it", nil];
    [loginWrongAlert show];
}

- (void)loadFeedView {
    [self.indicatorView stopAnimating];
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    FeedViewController *feedViewController = [[FeedViewController alloc] init];
    UINavigationController *feedNavigationController = [[UINavigationController alloc] initWithRootViewController:feedViewController];
    feedNavigationController.tabBarItem.title = @"News Feed";
    feedNavigationController.tabBarItem.image = [UIImage imageNamed:@"feed_tab_img"];
    
    RequestsViewController *requestsViewController = [[RequestsViewController alloc] init];
    UINavigationController *requestsNavigationController = [[UINavigationController alloc] initWithRootViewController:requestsViewController];
    requestsNavigationController.tabBarItem.title = @"Requests";
    
    MessagesViewController *messagesViewController = [[MessagesViewController alloc] init];
    UINavigationController *messagesNavigationController = [[UINavigationController alloc] initWithRootViewController:messagesViewController];
    messagesNavigationController.tabBarItem.title = @"Messages";
    messagesNavigationController.tabBarItem.image = [UIImage imageNamed:@"messages_tab_img"];
    
    NotificationsViewController *notificationsViewController = [[NotificationsViewController alloc] init];
    UINavigationController *notificationsNavigationController = [[UINavigationController alloc] initWithRootViewController:notificationsViewController];
    notificationsNavigationController.tabBarItem.title = @"Notifications";
    
    MoreViewController *moreViewController = [[MoreViewController alloc] init];
    UINavigationController *moreNavigationController = [[UINavigationController alloc] initWithRootViewController:moreViewController];
    moreNavigationController.tabBarItem.title = @"More";
    moreNavigationController.tabBarItem.image = [UIImage imageNamed:@"more_tab_img"];
    
    tabBarController.viewControllers = @[feedNavigationController, requestsNavigationController, messagesNavigationController, notificationsNavigationController, moreNavigationController];
    
    [self presentViewController:tabBarController animated:YES completion:nil];
}
@end
