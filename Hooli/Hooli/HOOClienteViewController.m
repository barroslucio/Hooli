//
//  HOOClienteViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/9/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOClienteViewController.h"

@interface HOOClienteViewController ()

@end

@implementation HOOClienteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

// procedimento para o teclado ser ocultado
- (void)ocultaTeclado:(UITapGestureRecognizer *)sender
{
    [self.nomeField resignFirstResponder];
    [self.cpfField resignFirstResponder];
    [self.emailField resignFirstResponder];
    [self.senhaField resignFirstResponder];
    [self.telefoneField resignFirstResponder];
    [self.cidadeField resignFirstResponder];
    [self.estadoField resignFirstResponder];
}

- (void)salvaDadosCliente
{
    HOOCliente *cliente;
    
    cliente.nome = self.nomeField.text;
    cliente.cpf = self.cpfField.text;
    cliente.telefone = self.telefoneField.text;
    cliente.email = self.emailField.text;
    cliente.senha = self.senhaField.text;
    cliente.cidade = self.cidadeField.text;
    cliente.estado = self.estadoField.text;
}

// salvando os dados dos clientes
- (IBAction)saveButton:(id)sender
{
    [self salvaDadosCliente];
    
}

@end
