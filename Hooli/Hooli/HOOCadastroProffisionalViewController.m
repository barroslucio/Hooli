//
//  HOOCadastroProffisionalViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 08/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

//NSArray *statesCodes = @[@"AC", @"AL", @"AM", @"AP", @"BA", @"CE", @"ES", @"GO", @"MA", @"MG", @"MS", @"MT", @"PA", @"PB", @"PE", @"PI", @"PR", @"RJ", @"RN", @"RO", @"RR", @"RS", @"SC", @"SE", @"SP", @"TO"];
//NSArray *statesNames = @[@"Acre", @"Alagoas", @"Amazonas", @"Amapá", @"Bahia", @"Ceará", @"Espírito Santo", @"Goiás", @"Maranhão", @"Minas Gerais", @"Mato Grosso do Sul", @"Mato Grosso", @"Pará", @"Paraíba", @"Pernambuco", @"Piauí", @"Paraná", @"Rio de Janeiro", @"Rio Grande do Norte", @"Rondônia", @"Roraima", @"Rio Grande do Sul", @"Santa Catarina", @"Sergipe", @"São Paulo", @"Tocantins"];


#import "HOOCadastroProffisionalViewController.h"
#import "HOOServicosDisponiveisViewController.h"
@interface HOOCadastroProffisionalViewController ()<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

//SCROL VIEW AND VIEW
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *viewScroll;

//BUTTON SAVE
- (IBAction)actionSave:(id)sender;

//TEXTFIELD
@property (weak, nonatomic) IBOutlet UITextField *textFieldNome;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSenha;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEndereco;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCidade;
@property (weak, nonatomic) IBOutlet UITextField *textFieldUF;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTelefone;
@property (weak, nonatomic) IBOutlet UITextField *textFieldRG;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCPF;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDDD;

//PIKER VIEW
@property (retain, nonatomic)  UIPickerView *pickerView;

//ARRAY DE ESTADOS
@property (nonatomic) NSArray* arrayUF;

//SWITCH
@property (weak, nonatomic) IBOutlet UISwitch *switchAlvenaria;
@property (weak, nonatomic) IBOutlet UISwitch *switchChaveiro;
@property (weak, nonatomic) IBOutlet UISwitch *switchEletrica;
@property (weak, nonatomic) IBOutlet UISwitch *switchHidraulica;
@property (weak, nonatomic) IBOutlet UISwitch *switchLimpeza;
@property (weak, nonatomic) IBOutlet UISwitch *switchPintura;

@end

@implementation HOOCadastroProffisionalViewController

//OBJETO DE USUÁRIO PROFISSIONAL



- (void)viewDidLoad {
    [super viewDidLoad];
    [self initProperties];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
    
    self.textFieldNome.layer.borderColor=[[UIColor colorWithRed:0.137 green:0.804 blue:0.922 alpha:1]CGColor];
    self.textFieldNome.layer.borderWidth=1.0;


}

//OCULTAR TECLADO
-(void)ocultaTeclado:(UITapGestureRecognizer *)sender{
    //Aquí hay que declarar todos los UITextField de nuestra escena
    [self.textFieldNome resignFirstResponder];
    [self.textFieldEmail resignFirstResponder];
    [self.textFieldSenha resignFirstResponder];
    [self.textFieldEndereco resignFirstResponder];
    [self.textFieldCidade resignFirstResponder];
    [self.textFieldUF resignFirstResponder];
    [self.textFieldTelefone resignFirstResponder];
    [self.textFieldRG resignFirstResponder];
    [self.textFieldCPF resignFirstResponder];
    [self.textFieldDDD resignFirstResponder];


}

//INICIA PROPERTIES
- (void)initProperties{
    
    self.switchAlvenaria.on = NO;
    self.switchChaveiro.on = NO;
    self.switchEletrica.on = NO;
    self.switchHidraulica.on = NO;
    self.switchLimpeza.on = NO;
    self.switchPintura.on = NO;
    
    
    //[self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.viewScroll.frame.size.height)];
    //[self.scrollView setScrollEnabled:TRUE];
    //[self.scrollView setShowsVerticalScrollIndicator:YES];
    //[self.scrollView setShowsHorizontalScrollIndicator:NO];

    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;
    self.textFieldUF.inputView = self.pickerView;
    
    self.arrayUF = @[@"Acre", @"Alagoas", @"Amazonas", @"Amapá", @"Bahia", @"Ceará", @"Distrito Federal", @"Espírito Santo", @"Goiás", @"Maranhão", @"Minas Gerais", @"Mato Grosso do Sul", @"Mato Grosso", @"Pará", @"Paraíba", @"Pernambuco", @"Piauí", @"Paraná", @"Rio de Janeiro", @"Rio Grande do Norte", @"Rondônia", @"Roraima", @"Rio Grande do Sul", @"Santa Catarina", @"Sergipe", @"São Paulo", @"Tocantins"];

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
    self.textFieldUF.text = @"Acre" ;
    return [self.arrayUF objectAtIndex:row];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
        self.textFieldUF.text=[self.arrayUF objectAtIndex:row];
}


//ALERTA DO STATUS DE CADASTRO
- (void)alertStatusCadastro:(NSString *)status{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alerta!" message:status delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    NSLog(@"Cadastro do Profissional recuzado");

}

- (void)cadastraProfissionalParse{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *telefone = [formatter numberFromString:self.textFieldTelefone.text];
    NSNumber *ddd = [formatter numberFromString:self.textFieldDDD.text];
    NSNumber *cpf = [formatter numberFromString:self.textFieldCPF.text];
    NSNumber *rg = [formatter numberFromString:self.textFieldRG.text];

    NSNumber *tipo = [NSNumber numberWithInt:1];;
    
    
    PFUser *user = [PFUser user];
    user.username =self.textFieldEmail.text;
    user.password = self.textFieldSenha.text;
    
    user[@"endereco"] = self.textFieldEndereco.text;
    user[@"email"]=self.textFieldEmail.text;
    user[@"estado"] = self.textFieldUF.text;
    user[@"cidade"] = self.textFieldCidade.text;
    user[@"ddd"] = ddd;
    user[@"telefone"] = telefone;
    user[@"cpf"] = cpf;
    user[@"rg"] = rg;
    user[@"nome"] = self.textFieldNome.text;
    user[@"tipo"] =  tipo;
    user[@"hidraulica"] =  [NSNumber numberWithBool:self.switchHidraulica.on];
    user[@"pintura"] =  [NSNumber numberWithBool:self.switchPintura.on];
    user[@"limpeza"] =  [NSNumber numberWithBool:self.switchLimpeza.on];
    user[@"eletrica"] =  [NSNumber numberWithBool:self.switchEletrica.on];
    user[@"alvenaria"] =  [NSNumber numberWithBool:self.switchAlvenaria.on];
    user[@"chaveiro"] =  [NSNumber numberWithBool:self.switchChaveiro.on];

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error)
        {   // Hooray! Let them use the app now.
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Cadastro bem sucedido"
                                                                message:@"Obrigado!"
                                                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            [self segueViewController];
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


//ACTION - SALVAR DADOS
- (IBAction)actionSave:(id)sender {

    NSString *statusCadastro;
    
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
    if (![self.textFieldNome.text isEqualToString:@""] && ![self.textFieldEmail.text isEqualToString:@""] && ![self.textFieldSenha.text isEqualToString:@""] && ![self.textFieldEndereco.text isEqualToString:@""] && ![self.textFieldCidade.text isEqualToString:@""] && ![self.textFieldUF.text isEqualToString:@""] && ![self.textFieldTelefone.text isEqualToString:@""] && ![self.textFieldRG.text isEqualToString:@""] && ![self.textFieldCPF.text isEqualToString:@""] && ![self.textFieldDDD.text isEqualToString:@""]) {
        
        //VERIFICA SE ALGUMA PROFISSÃO FOI MARCADA
        if (self.switchAlvenaria.on == YES || self.switchChaveiro.on == YES || self.switchEletrica.on == YES || self.switchHidraulica.on == YES || self.switchLimpeza.on == YES || self.switchPintura.on == YES){
        
            [self cadastraProfissionalParse];
        } else{
            statusCadastro = @"Selecione pelo menos um serviço";
            [self alertStatusCadastro:statusCadastro];

        }
    
        
    } else {
        statusCadastro = @"Preencha todos os campos";
        [self alertStatusCadastro:statusCadastro];
    }
    
}

- (void)segueViewController{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HOOServicosDisponiveisViewController *viewController = (HOOServicosDisponiveisViewController *)[storyboard instantiateViewControllerWithIdentifier:@"Pro"];
        [self presentViewController:viewController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
