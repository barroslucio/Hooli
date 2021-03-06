//
//  HOOEditUsuarioViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/12/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOEditUsuarioViewController.h"

@interface HOOEditUsuarioViewController ()<UITextFieldDelegate>

@end

@implementation HOOEditUsuarioViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self buscaDadosClienteParse];
    self.tfRespEndereco.delegate = self;
    self.tfRespEmail.delegate = self;
    self.tfRespSenha.delegate = self;
    self.tfRespDDD.delegate = self;
    self.tfRespTelefone.delegate = self;
    self.tfRespCidade.delegate = self;
    self.tfRespEstado.delegate = self;
    
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
    if (![self.tfRespCidade.text isEqualToString:@""] && ![self.tfRespDDD.text isEqualToString:@""] && ![self.tfRespEmail.text isEqualToString:@""] && ![self.tfRespEndereco.text isEqualToString:@""] && ![self.tfRespEstado.text isEqualToString:@""] && ![self.tfRespSenha.text isEqualToString:@""] && ![self.tfRespTelefone.text isEqualToString:@""])
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
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Erro"
                                                            message:@"Preencha todos os campos!"
                                                           delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
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
    [self.tfRespDDD resignFirstResponder];
    
    
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
