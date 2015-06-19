//
//  ViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 08/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOLoginViewController.h"
#import "HOOAgendarServicoViewController.h"
#import "HOOEscolhaCadastroViewController.h"


@interface HOOLoginViewController ()<UITextFieldDelegate>{
    UIFloatLabelTextField *emailTextField;
    UIFloatLabelTextField *senhaTextField;
}

@end

@implementation HOOLoginViewController
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[PresentingAnimationPopUpController alloc] init];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[DismissingAnimationController alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameDidChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    //Oculta teclado
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
    
    
    
    emailTextField = [UIFloatLabelTextField new];
    [emailTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    emailTextField.floatLabelActiveColor = [UIColor orangeColor];
    emailTextField.placeholder = @"Email";
    emailTextField.delegate = self;
    [self.subviewEmail addSubview:emailTextField];
    
   
   [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[emailTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(emailTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[emailTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(emailTextField)]];
    
    senhaTextField = [UIFloatLabelTextField new];
    [senhaTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    senhaTextField.floatLabelActiveColor = [UIColor orangeColor];
    senhaTextField.placeholder = @"Senha";
    senhaTextField.delegate = self;
    [self.subviewSenha addSubview:senhaTextField];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[senhaTextField]-0-|"
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
    [emailTextField resignFirstResponder];
    [senhaTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)login:(id)sender {
    
    
    NSString *username = [emailTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [senhaTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] == 0 || [password length] == 0) {
        
        POPSpringAnimation *shake = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
        
        shake.springBounciness = 20;
        shake.velocity = @(3000);
       
        [self.subviewSenha.layer pop_addAnimation:shake forKey:@"shakePassword"];
        
        POPSpringAnimation *shake2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
        
        shake2.springBounciness = 20;
        shake2.velocity = @(3000);
        
        [self.subviewEmail.layer pop_addAnimation:shake2 forKey:@"shakePassword"];
        
        
    }
    else {
        
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            if (error) {
                POPSpringAnimation *shake = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
                
                shake.springBounciness = 20;
                shake.velocity = @(3000);
                
                [self.subviewSenha.layer pop_addAnimation:shake forKey:@"shakePassword"];
                
                POPSpringAnimation *shake2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
                
                shake2.springBounciness = 20;
                shake2.velocity = @(3000);
                
                [self.subviewEmail.layer pop_addAnimation:shake2 forKey:@"shakePassword"];
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

- (void)keyboardFrameDidChange:(NSNotification *)notification
{
    CGRect keyboardEndFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect keyboardBeginFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    UIViewAnimationCurve animationCurve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] integerValue];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    CGRect newFrame = self.view.frame;
    CGRect keyboardFrameEnd = [self.view convertRect:keyboardEndFrame toView:nil];
    CGRect keyboardFrameBegin = [self.view convertRect:keyboardBeginFrame toView:nil];
    
    newFrame.origin.y -= (keyboardFrameBegin.origin.y - keyboardFrameEnd.origin.y);
    self.view.frame = newFrame;
    
    [UIView commitAnimations];
}
- (IBAction)cadastroButton:(id)sender {
    
    HOOEscolhaCadastroViewController *modalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"escolhaCadastro"];
    
    
    modalVC.transitioningDelegate = self;
    
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:modalVC animated:YES completion:nil];
}

@end
