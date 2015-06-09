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
static HOOUsuarioProfissional *profissional;

+ (HOOUsuarioProfissional*) profissional{
    return profissional;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initProperties];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];

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

}

//INICIA PROPERTIES
- (void)initProperties{
    
    self.switchAlvenaria.on = NO;
    self.switchChaveiro.on = NO;
    self.switchEletrica.on = NO;
    self.switchHidraulica.on = NO;
    self.switchLimpeza.on = NO;
    self.switchPintura.on = NO;
    
    profissional = [[HOOUsuarioProfissional alloc] init];
    
    [self.scrollView setContentSize:CGSizeMake(self.viewScroll.frame.size.width, self.viewScroll.frame.size.height)];
    [self.scrollView setScrollEnabled:TRUE];
    [self.scrollView setShowsVerticalScrollIndicator:YES];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];

    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;
    self.textFieldUF.inputView = self.pickerView;
    
    self.arrayUF = @[@"Acre", @"Alagoas", @"Amazonas", @"Amapá", @"Bahia", @"Ceará", @"Espírito Santo", @"Goiás", @"Maranhão", @"Minas Gerais", @"Mato Grosso do Sul", @"Mato Grosso", @"Pará", @"Paraíba", @"Pernambuco", @"Piauí", @"Paraná", @"Rio de Janeiro", @"Rio Grande do Norte", @"Rondônia", @"Roraima", @"Rio Grande do Sul", @"Santa Catarina", @"Sergipe", @"São Paulo", @"Tocantins"];

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

//SALVA OS DADOS DA TELA NO OBJETO
- (void)saveDados{
    
    profissional.nome = self.textFieldNome.text;
    profissional.email = self.textFieldEmail.text;
    profissional.senha = self.textFieldSenha.text;
    profissional.endereco = self.textFieldEndereco.text;
    profissional.cidade = self.textFieldCidade.text;
    profissional.uf = self.textFieldUF.text;
    profissional.telefone = self.textFieldTelefone.text;
    
    if (self.switchAlvenaria.on == YES) {
        profissional.alvenaria = YES;
    } else {
        profissional.alvenaria = NO;
    }
    if (self.switchChaveiro.on == YES) {
        profissional.chaveiro = YES;
    } else {
        profissional.chaveiro = NO;
    }
    if (self.switchEletrica.on == YES) {
        profissional.eletrica = YES;
    } else {
        profissional.eletrica = NO;
    }
    if (self.switchHidraulica.on == YES) {
        profissional.hidraulica = YES;
    } else {
        profissional.hidraulica = NO;
    }
    if (self.switchLimpeza.on == YES) {
        profissional.limpeza = YES;
    } else {
        profissional.limpeza = NO;
    }
    if (self.switchPintura.on == YES) {
        profissional.pintura = YES;
    } else {
        profissional.pintura = NO;
    }
}

//ACTION - SALVAR DADOS
- (IBAction)actionSave:(id)sender {

    NSString *statusCadastro;
    
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
    if (![self.textFieldNome.text isEqualToString:@""] && ![self.textFieldEmail.text isEqualToString:@""] && ![self.textFieldSenha.text isEqualToString:@""] && ![self.textFieldEndereco.text isEqualToString:@""] && ![self.textFieldCidade.text isEqualToString:@""] && ![self.textFieldUF.text isEqualToString:@""] && ![self.textFieldTelefone.text isEqualToString:@""]) {
        
        //VERIFICA SE ALGUMA PROFISSÃO FOI MARCADA
        if (self.switchAlvenaria.on == YES || self.switchChaveiro.on == YES || self.switchEletrica.on == YES || self.switchHidraulica.on == YES || self.switchLimpeza.on == YES || self.switchPintura.on == YES){
            NSLog(@"Cadastro do Profissional relaizado com sucesso");
        
            statusCadastro = @"Cadastro bem sucedido";
        
        } else{
            statusCadastro = @"Selecione pelo menos um serviço";
        }
        [self saveDados];
        
        //MÉTODO - SALVAR DADOS
        [self alertStatusCadastro:statusCadastro];
        
        NSLog(@"\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n", profissional.nome, profissional.email, profissional.senha, profissional.endereco, profissional.cidade, profissional.uf, profissional.telefone);
        
    } else {
        statusCadastro = @"Preencha todos os campos";
        [self alertStatusCadastro:statusCadastro];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
