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
        self.swAlvenariaEdit.on = YES;
    }
    else if (!alvenaria)
    {
        self.swAlvenariaEdit.on = NO;
    }
    
    if (chaveiro)
    {
        self.swChaveiroEdit.on = YES;
    }
    else if (!chaveiro)
    {
        self.swChaveiroEdit.on = NO;
    }
    
    if (eletrica)
    {
        self.swEletricaEdit.on = YES;
    }
    else if (!eletrica)
    {
        self.swEletricaEdit.on = NO;
    }
    
    if (hidraulica)
    {
        self.swHidraulicaEdit.on = YES;
    }
    else if (!hidraulica)
    {
        self.swHidraulicaEdit.on = NO;
    }
    
    if (limpeza)
    {
        self.swLimpezaEdit.on = YES;
    }
    else if (!limpeza)
    {
        self.swLimpezaEdit.on = NO;
    }
    
    if (pintura)
    {
        self.swPinturaEdit.on = YES;
    }
    else if (!pintura)
    {
        self.swPinturaEdit.on = NO;
    }
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
    user[@"alvenaria"] = self.swAlvenariaEdit;
    
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
