//
//  HOOEditProfissionalViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/15/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOEditProfissionalViewController.h"

@interface HOOEditProfissionalViewController ()<UITextFieldDelegate>

@end

@implementation HOOEditProfissionalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self requisicaoServicos];
    [self buscaDadosProfissionalParse];
    
    self.tfEndereco.delegate = self;
    self.tfEmail.delegate = self;
    self.tfSenha.delegate = self;
    self.tfDDD.delegate = self;
    self.tfTelefone.delegate = self;
    self.tfCidade.delegate = self;
    self.tfEstado.delegate = self;
    
    //OCULTA TECLADO
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

// método para pegar os trabalhos do profissional, direto do Parse
- (void)requisicaoServicos
{
    PFUser *user = [PFUser currentUser];
    
    // comparação para ver qual os trabalhos desempenhados pelo profissional
    if ([user[@"alvenaria"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swAlvenariaEdit.on = YES;
    }
    else
    {
        self.swAlvenariaEdit.on = NO;
    }
    
    if ([user[@"chaveiro"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swChaveiroEdit.on = YES;
    }
    else
    {
        self.swChaveiroEdit.on = NO;
    }
    
    if ([user[@"eletrica"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swEletricaEdit.on = YES;
    }
    else
    {
        self.swEletricaEdit.on = NO;
    }
    
    if ([user[@"hidraulica"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swHidraulicaEdit.on = YES;
    }
    else
    {
        self.swHidraulicaEdit.on = NO;
    }
    
    if ([user[@"limpeza"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swLimpezaEdit.on = YES;
    }
    else
    {
        self.swLimpezaEdit.on = NO;
    }
    
    if ([user[@"pintura"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swPinturaEdit.on = YES;
    }
    else
    {
        self.swPinturaEdit.on = NO;
    }
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
    [self.tfEndereco setText:endereco];
    [self.tfEmail setText:email];
    [self.tfSenha setText:senha];
    [self.tfDDD setText:[NSString stringWithFormat: @"%ld", (long)ddd]];
    [self.tfTelefone setText:[NSString stringWithFormat: @"%ld", (long)telefone]];
    [self.tfCidade setText:cidade];
    [self.tfEstado setText:estado];
    
}


// método para salvar as alterações do usuário
- (IBAction)saveButton:(id)sender
{
    PFUser *user = [PFUser currentUser];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    // variável para tratar os valores que são numéricos
    f.numberStyle = NSNumberFormatterDecimalStyle;
    
    user[@"endereco"] = self.tfEndereco.text;
    user[@"email"] = self.tfEmail.text;
    user[@"senha"] = self.tfSenha.text;
    user[@"ddd"] = [f numberFromString:self.tfDDD.text];
    user[@"telefone"] = [f numberFromString:self.tfTelefone.text];
    user[@"cidade"] = self.tfCidade.text;
    user[@"estado"] = self.tfEstado.text;
    
    // salvar as alterações no Parse
    user[@"hidraulica"] =  [NSNumber numberWithBool:self.swHidraulicaEdit.on];
    user[@"pintura"] =  [NSNumber numberWithBool:self.swPinturaEdit.on];
    user[@"limpeza"] =  [NSNumber numberWithBool:self.swLimpezaEdit.on];
    user[@"eletrica"] =  [NSNumber numberWithBool:self.swEletricaEdit.on];
    user[@"alvenaria"] =  [NSNumber numberWithBool:self.swAlvenariaEdit.on];
    user[@"chaveiro"] =  [NSNumber numberWithBool:self.swChaveiroEdit.on];

    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if (succeeded)
        {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            HOOPerfilProfissionalViewController *viewController = (HOOPerfilProfissionalViewController *)[storyboard instantiateViewControllerWithIdentifier:@"perfilPro"];
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
    [self.tfTelefone resignFirstResponder];
    [self.tfEmail resignFirstResponder];
    [self.tfSenha resignFirstResponder];
    [self.tfCidade resignFirstResponder];
    [self.tfEstado resignFirstResponder];
    [self.tfEndereco resignFirstResponder];
    [self.tfDDD resignFirstResponder];
    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self animate:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self animate:NO];
}

- (void) animate: (BOOL)up {
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}


@end
