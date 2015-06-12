//
//  HOOAgendarServicoViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOAgendarServicoViewController.h"
#import "HOOLoginViewController.h"
#import "HOOAgendaOutroEnderecoViewController.h"


@interface HOOAgendarServicoViewController (){
    int tipoDeServico;
}

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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"outroEndereco"]){
        HOOAgendaOutroEnderecoViewController *controller = (HOOAgendaOutroEnderecoViewController *)segue.destinationViewController;
        
        controller.tipoDeServico = tipoDeServico;
    }
}

- (IBAction)logout:(id)sender {
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser];
    if (!currentUser){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HOOLoginViewController *viewController = (HOOLoginViewController *)[storyboard instantiateViewControllerWithIdentifier:@"login"];
        [self presentViewController:viewController animated:YES completion:nil];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Em outro lugar"]){
        [self performSegueWithIdentifier:@"outroEndereco" sender:self];
    }
    else if ([buttonTitle isEqualToString:@"No mesmo endereço"]){
        [self performSegueWithIdentifier:@"mesmoEndereco" sender:self];
    }
}

-(void)alerta{
    UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"Atenção!" message:@"O serviço vai ser feito no seu endereço cadastrado ou em outro lugar?" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"No mesmo endereço",@"Em outro lugar", nil];
    [myAlert show];
}

- (IBAction)hidraulica:(id)sender {
    tipoDeServico = 4;
    [self alerta];
}

- (IBAction)limpeza:(id)sender {
    tipoDeServico = 5;

    [self alerta];

}

- (IBAction)pintura:(id)sender {
    tipoDeServico = 6;

    [self alerta];

}

- (IBAction)chaveiro:(id)sender {
    tipoDeServico = 2;

    [self alerta];

}

- (IBAction)eletrica:(id)sender {
    tipoDeServico = 3;

    [self alerta];

}

- (IBAction)alvenaria:(id)sender {
    tipoDeServico = 1;

    [self alerta];

}
@end
