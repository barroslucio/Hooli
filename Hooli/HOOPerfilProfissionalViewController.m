//
//  HOOPerfilProfissionalViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/15/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOPerfilProfissionalViewController.h"

@interface HOOPerfilProfissionalViewController ()

@end

@implementation HOOPerfilProfissionalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self buscaDadosProfissionalParse];
    [self requisicaoServicos];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

// procedimento para pegar as informações do cliente no parse
- (void)buscaDadosProfissionalParse
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
    [self.lbEndereco setText:endereco];
    [self.lbEmail setText:email];
    [self.lbSenha setText:senha];
    [self.lbDDD setText:[NSString stringWithFormat: @"%ld", (long)ddd]];
    [self.lbTelefone setText:[NSString stringWithFormat: @"%ld", (long)telefone]];
    [self.lbCidade setText:cidade];
    [self.lbEstado setText:estado];
}

// método para pegar os trabalhos do profissional, direto do Parse
- (void)requisicaoServicos
{
    PFUser *user = [PFUser currentUser];
    
    // declarando variáveis booleanas conformo os atributos do Parse estão declarados
    Boolean alvenaria = [user objectForKey:@"alvenaria"];
    Boolean chaveiro = [user objectForKey:@"chaveiro"];
    Boolean eletrica = [user objectForKey:@"eletrico"];
    Boolean hidraulica = [user objectForKey:@"hidraulica"];
    Boolean limpeza = [user objectForKey:@"limpeza"];
    Boolean pintura = [user objectForKey:@"pintura"];
    
    // comparações para ver qual o trabalho desempenhado pelo profissional
    if (alvenaria)
    {
        self.swAlvenaria.on = YES;
        self.swAlvenaria.enabled = NO; // comando para o botão fical inalterável
    }
    else if (!alvenaria)
    {
        self.swAlvenaria.on = NO;
    }
    
    if (chaveiro)
    {
        self.swChaveiro.on = YES;
        self.swChaveiro.enabled = NO;
        
    }
    else if (!chaveiro)
    {
        self.swChaveiro.on = NO;
    }
    
    if (eletrica)
    {
        self.swEletrica.on = YES;
        self.swEletrica.enabled = NO;
    }
    else if (!eletrica)
    {
        self.swEletrica.on = NO;
    }
    
    if (hidraulica)
    {
        self.swHidraulica.on = YES;
        self.swHidraulica.enabled = NO;
    }
    else if (!hidraulica)
    {
        self.swHidraulica.on = NO;
    }
    
    if (limpeza)
    {
        self.swLimpeza.on = YES;
        self.swLimpeza.enabled = NO;
    }
    else if (!limpeza)
    {
        self.swLimpeza.on = NO;
    }
    
    if (pintura)
    {
        self.swPintura.on = YES;
        self.swPintura.enabled = NO;
    }
    else if (!pintura)
    {
        self.swPintura.on = NO;
    }
}

@end
