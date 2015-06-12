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
    [self.tfRespCidade setText:estado];
    
}



- (IBAction)saveChangesButton:(id)sender
{
    

    
}
@end
