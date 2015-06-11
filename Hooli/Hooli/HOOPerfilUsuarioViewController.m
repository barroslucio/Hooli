//
//  HOOPerfilUsuarioViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/11/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOPerfilUsuarioViewController.h"

@interface HOOPerfilUsuarioViewController ()

@end

@implementation HOOPerfilUsuarioViewController

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
    NSString *ddd = [user objectForKey:@"ddd"];
    NSString *telefone = [user objectForKey:@"telefone"];
    NSString *cidade = [user objectForKey:@"cidade"];
    NSString *estado = [user objectForKey:@"estado"];
    
    // jogando para a tela
    [self.respEnderecoLabel setText:endereco];
    [self.respEmailLabel setText:email];
    [self.respSenhaLabel setText:senha];
    [self.respDDDLabel setText:ddd];
    [self.respTelefoneLabel setText:telefone];
    [self.respCidadeLabel setText:cidade];
    [self.respEstadoLabel setText:estado];
    
}


- (IBAction)editButton:(id)sender
{
    
}
@end
