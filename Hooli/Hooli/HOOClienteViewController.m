//
//  HOOClienteViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/9/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOClienteViewController.h"

@interface HOOClienteViewController () <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@end

@implementation HOOClienteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;
    self.estadoField.inputView = self.pickerView;
    
    self.arrayUF = @[@"Acre", @"Alagoas", @"Amazonas", @"Amapá", @"Bahia", @"Ceará", @"Espírito Santo", @"Goiás", @"Maranhão", @"Minas Gerais", @"Mato Grosso do Sul", @"Mato Grosso", @"Pará", @"Paraíba", @"Pernambuco", @"Piauí", @"Paraná", @"Rio de Janeiro", @"Rio Grande do Norte", @"Rondônia", @"Roraima", @"Rio Grande do Sul", @"Santa Catarina", @"Sergipe", @"São Paulo", @"Tocantins"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

//PIKER VIEW - ESTADOS
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.arrayUF count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    self.estadoField.text = @"Acre" ;
    return [self.arrayUF objectAtIndex:row];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.estadoField.text=[self.arrayUF objectAtIndex:row];
}

//ALERTA DO STATUS DE CADASTRO
- (void)alertStatusCadastro:(NSString *)status
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alerta!" message:status delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
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
    NSString *statusCadastro;
    
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
    if (![self.nomeField.text isEqualToString:@""] && ![self.emailField.text isEqualToString:@""] && ![self.senhaField.text isEqualToString:@""] && ![self.cpfField.text isEqualToString:@""] && ![self.cidadeField.text isEqualToString:@""] && ![self.estadoField.text isEqualToString:@""] && ![self.telefoneField.text isEqualToString:@""])
    {
        statusCadastro = @"Cadastro bem sucedido";
            
    
    [self salvaDadosCliente];
        
    //MÉTODO - SALVAR DADOS
    [self alertStatusCadastro:statusCadastro];
    }

    else
    {
        statusCadastro = @"Preencha todos os campos";
        [self alertStatusCadastro:statusCadastro];
    }

    
}

@end
