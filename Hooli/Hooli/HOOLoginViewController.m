//
//  ViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 08/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOLoginViewController.h"
#import "HOOAgendarServicoViewController.h"

@interface HOOLoginViewController ()<UITextFieldDelegate>

@end

@implementation HOOLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Oculta teclado
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
}

- (void)ocultaTeclado:(UITapGestureRecognizer *)sender
{
    [self.emailField resignFirstResponder];
    [self.senhaField resignFirstResponder];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)login:(id)sender {
    NSString *username = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.senhaField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] == 0 || [password length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                            message:@"Make sure you enter a username and password!"
                                                           delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else {
        
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                                    message:[error.userInfo objectForKey:@"error"]
                                                                   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
            else {
                NSNumber* number = [[PFUser currentUser] objectForKey:@"tipo"];
                int tipo = [number intValue];
                if (tipo == 0){
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    HOOAgendarServicoViewController *viewController = (HOOAgendarServicoViewController *)[storyboard instantiateViewControllerWithIdentifier:@"User"];
                    [self presentViewController:viewController animated:YES completion:nil];
                
                }
                else if (tipo == 1){
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    HOOAgendarServicoViewController *viewController = (HOOAgendarServicoViewController *)[storyboard instantiateViewControllerWithIdentifier:@"Pro"];
                    [self presentViewController:viewController animated:YES completion:nil];
                    
                }
            }
        }];
    }

}
@end
