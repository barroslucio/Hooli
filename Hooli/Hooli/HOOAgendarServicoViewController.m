//
//  HOOAgendarServicoViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOAgendarServicoViewController.h"
#import "HOOLoginViewController.h"

@interface HOOAgendarServicoViewController ()

@end

@implementation HOOAgendarServicoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showDetailSegue"]){
        ViewControllerB *controller = (ViewControllerB *)segue.destinationViewController;
        controller.isSomethingEnabled = YES;
    }
}
*/
- (IBAction)logout:(id)sender {
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser];
    if (!currentUser){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HOOLoginViewController *viewController = (HOOLoginViewController *)[storyboard instantiateViewControllerWithIdentifier:@"login"];
        [self presentViewController:viewController animated:YES completion:nil];
    }
}

- (IBAction)hidraulica:(id)sender {
}

- (IBAction)limpeza:(id)sender {
}

- (IBAction)pintura:(id)sender {
}

- (IBAction)chaveiro:(id)sender {
}

- (IBAction)eletrica:(id)sender {
}

- (IBAction)alvenaria:(id)sender {
}
@end
