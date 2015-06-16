//
//  ViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 08/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOLoginViewController.h"
#import "HOOAgendarServicoViewController.h"

@interface HOOLoginViewController ()<UITextFieldDelegate>{
    UIFloatLabelTextField *firstNameTextField;
    UIFloatLabelTextField *senhaTextField;

}

@end

@implementation HOOLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Oculta teclado
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
    
    
    
    firstNameTextField = [UIFloatLabelTextField new];
    [firstNameTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    firstNameTextField.floatLabelActiveColor = [UIColor orangeColor];
    firstNameTextField.placeholder = @"Email";
    firstNameTextField.delegate = self;
    [self.subviewEmail addSubview:firstNameTextField];
    
   
   [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[firstNameTextField]-10-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(firstNameTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[firstNameTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(firstNameTextField)]];
    
    senhaTextField = [UIFloatLabelTextField new];
    [senhaTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    senhaTextField.floatLabelActiveColor = [UIColor orangeColor];
    senhaTextField.placeholder = @"Senha";
    senhaTextField.delegate = self;
    [self.subviewSenha addSubview:senhaTextField];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[senhaTextField]-10-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(senhaTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[senhaTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(senhaTextField)]];
}

- (void)ocultaTeclado:(UITapGestureRecognizer *)sender
{
    [firstNameTextField resignFirstResponder];
    [self.senhaField resignFirstResponder];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)login:(id)sender {
    NSString *username = [firstNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
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
