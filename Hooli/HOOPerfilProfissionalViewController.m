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
    
    // função para desativar os botões
    self.swAlvenaria.enabled = NO;
    self.swChaveiro.enabled = NO;
    self.swEletrica.enabled = NO;
    self.swHidraulica.enabled = NO;
    self.swLimpeza.enabled = NO;
    self.swPintura.enabled = NO;
    
    // comparação para ver qual os trabalhos desempenhados pelo profissional
    if ([user[@"alvenaria"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swAlvenaria.on = YES;
    }
    else
    {
        self.swAlvenaria.on = NO;
    }
    
    if ([user[@"chaveiro"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swChaveiro.on = YES;
    }
    else
    {
        self.swChaveiro.on = NO;
    }
    
    if ([user[@"eletrica"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swEletrica.on = YES;
    }
    else
    {
        self.swEletrica.on = NO;
    }
    
    if ([user[@"hidraulica"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swHidraulica.on = YES;
    }
    else
    {
        self.swHidraulica.on = NO;
    }
    
    if ([user[@"limpeza"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swLimpeza.on = YES;
    }
    else
    {
        self.swLimpeza.on = NO;
    }
    
    if ([user[@"pintura"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swPintura.on = YES;
    }
    else
    {
        self.swPintura.on = NO;
    }




    
    
    
    
}

@end
