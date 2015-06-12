//
//  HOOEditUsuarioViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/12/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOEditUsuarioViewController.h"

@interface HOOEditUsuarioViewController ()

@end

@implementation HOOEditUsuarioViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self buscaDadosClienteParse];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

// procedimento para pegar as informações do cliente no parse
- (void)buscaDadosClienteParse
{
    // variável para pegar as informações
    PFUser *user = [PFUser currentUser];
    
    // criando as variáveis para usar o Parse
    NSString *endereco = [user objectForKey:@"endereco"];
    NSString *email = [user objectForKey:@"email"];
    NSString *senha = [user objectForKey:@"senha"];
    NSInteger ddd = [[user objectForKey:@"ddd"] intValue];
    NSInteger telefone = [[user objectForKey:@"telefone"] intValue];
    NSString *cidade = [user objectForKey:@"cidade"];
    NSString *estado = [user objectForKey:@"estado"];
    
    // jogando para a tela
    [self.tfRespEndereco setText:endereco];
    [self.tfRespEmail setText:email];
    [self.tfRespSenha setText:senha];
    [self.tfRespDDD setText:[NSString stringWithFormat: @"%ld", (long)ddd]];
    [self.tfRespTelefone setText:[NSString stringWithFormat: @"%ld", (long)telefone]];
    [self.tfRespCidade setText:cidade];
    [self.tfRespEstado setText:estado];
    
}


// método para salvar as alterações do usuário
- (IBAction)saveChangesButton:(id)sender
{
    PFUser *user = [PFUser currentUser];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    f.numberStyle = NSNumberFormatterDecimalStyle;
    
    user[@"endereco"] = self.tfRespEndereco.text;
    user[@"email"] = self.tfRespEmail.text;
    user[@"senha"] = self.tfRespSenha.text;
    user[@"ddd"] = [f numberFromString:self.tfRespDDD.text];
    user[@"telefone"] = [f numberFromString:self.tfRespTelefone.text];
    user[@"cidade"] = self.tfRespCidade.text;
    user[@"estado"] = self.tfRespEstado.text;
    
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if (succeeded)
        {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            HOOPerfilUsuarioViewController *viewController = (HOOPerfilUsuarioViewController *)[storyboard instantiateViewControllerWithIdentifier:@"perfilID"];
            [self presentViewController:viewController animated:YES completion:nil];
            
            
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                                message:[error.userInfo objectForKey:@"error"]
                                                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];

        }
    }];
}

-(void)ocultaTeclado:(UITapGestureRecognizer *)sender
{
    //Aquí hay que declarar todos los UITextField de nuestra escena
    [self.tfRespTelefone resignFirstResponder];
    [self.tfRespEmail resignFirstResponder];
    [self.tfRespSenha resignFirstResponder];
    [self.tfRespCidade resignFirstResponder];
    [self.tfRespEstado resignFirstResponder];
    [self.tfRespEndereco resignFirstResponder];
    
    
}
@end
