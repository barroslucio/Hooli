//
//  HOOClienteViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/9/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOClienteViewController.h"
#import "HOOAgendarServicoViewController.h"
@interface HOOClienteViewController () <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@end

@implementation HOOClienteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.emailField.layer.borderColor=[[UIColor colorWithRed:0.137 green:0.804 blue:0.922 alpha:1]CGColor];
    self.emailField.layer.borderWidth=1.0;
    self.emailField.delegate = self;
    
    self.dddField.layer.borderColor=[[UIColor colorWithRed:0.137 green:0.804 blue:0.922 alpha:1]CGColor];
    self.dddField.layer.borderWidth=1.0;
    self.dddField.delegate = self;
    
    self.senhaField.layer.borderColor=[[UIColor colorWithRed:0.137 green:0.804 blue:0.922 alpha:1]CGColor];
    self.senhaField.layer.borderWidth=1.0;
    self.senhaField.delegate = self;
    
    self.enderecoField.layer.borderColor=[[UIColor colorWithRed:0.137 green:0.804 blue:0.922 alpha:1]CGColor];
    self.enderecoField.layer.borderWidth=1.0;
    self.enderecoField.delegate = self;
    
    self.cidadeField.layer.borderColor=[[UIColor colorWithRed:0.137 green:0.804 blue:0.922 alpha:1]CGColor];
    self.cidadeField.layer.borderWidth=1.0;
    self.cidadeField.delegate = self;
    
    self.estadoField.layer.borderColor=[[UIColor colorWithRed:0.137 green:0.804 blue:0.922 alpha:1]CGColor];
    self.estadoField.layer.borderWidth=1.0;
    self.estadoField.delegate = self;
    
    self.telefoneField.layer.borderColor=[[UIColor colorWithRed:0.137 green:0.804 blue:0.922 alpha:1]CGColor];
    self.telefoneField.layer.borderWidth=1.0;
    self.telefoneField.delegate = self;
    
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
    [self.emailField resignFirstResponder];
    [self.senhaField resignFirstResponder];
    [self.telefoneField resignFirstResponder];
    [self.cidadeField resignFirstResponder];
    [self.estadoField resignFirstResponder];
    [self.enderecoField resignFirstResponder];
    [self.dddField resignFirstResponder];

}

- (void)cadastraClienteParse{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *telefone = [formatter numberFromString:self.telefoneField.text];
    NSNumber *ddd = [formatter numberFromString:self.dddField.text];
    NSNumber *tipo = [NSNumber numberWithInt:0];;
    
    PFUser *user = [PFUser user];
    user.username =self.emailField.text;
    user.password = self.senhaField.text;


    user[@"endereco"] = self.enderecoField.text;
    user[@"email"]=self.emailField.text;
    user[@"estado"] = self.estadoField.text;
    user[@"cidade"] = self.cidadeField.text;
    user[@"ddd"] = ddd;
    user[@"telefone"] = telefone;
    user[@"tipo"] = tipo;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error)
        {   // Hooray! Let them use the app now.
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Cadastro bem sucedido"
                                                                message:@"Obrigado!"
                                                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            [self segueViewController];
        } else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                                message:[error.userInfo objectForKey:@"error"]
                                                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];

        }
    }];
}

// salvando os dados dos clientes
- (IBAction)saveButton:(id)sender
{
    NSString *statusCadastro;
    
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
    if (![self.dddField.text isEqualToString:@""] && ![self.emailField.text isEqualToString:@""] && ![self.senhaField.text isEqualToString:@""]  && ![self.cidadeField.text isEqualToString:@""] && ![self.estadoField.text isEqualToString:@""] && ![self.telefoneField.text isEqualToString:@""] && ![self.enderecoField.text isEqualToString:@""])
    {
        //Método para salvar no Parse.com
        [self cadastraClienteParse];
    }

    else
    {
        statusCadastro = @"Preencha todos os campos";
        [self alertStatusCadastro:statusCadastro];
    }

    
}
- (void)segueViewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HOOAgendarServicoViewController *viewController = (HOOAgendarServicoViewController *)[storyboard instantiateViewControllerWithIdentifier:@"User"];
    [self presentViewController:viewController animated:YES completion:nil];
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    [self animate:YES];
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    [self animate:NO];
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
