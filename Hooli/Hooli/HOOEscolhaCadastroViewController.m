//
//  HOOEscolhaCadastroViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 18/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOEscolhaCadastroViewController.h"
#import "HOOClienteViewController.h"
#import "HOOCadastroProffisionalViewController.h"

@interface HOOEscolhaCadastroViewController ()

@end

@implementation HOOEscolhaCadastroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)usuarioButton:(id)sender {
    HOOClienteViewController *modalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"cadastroUsuario"];
    
    
    modalVC.transitioningDelegate = self;
    
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:modalVC animated:YES completion:nil];

    
}
- (IBAction)profissionalButton:(id)sender {
    
    HOOCadastroProffisionalViewController *modalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"cadastroPro"];
    
    
    modalVC.transitioningDelegate = self;
    
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:modalVC animated:YES completion:nil];
    
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[PresentingAnimationController alloc] init];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[DismissingAnimationController alloc] init];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
