//
//  HOOCadastroProffisionalViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 08/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOCadastroProffisionalViewController.h"

@interface HOOCadastroProffisionalViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *viewScroll;
- (IBAction)actionSave:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNome;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSenha;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEndereco;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCidade;
@property (weak, nonatomic) IBOutlet UITextField *textFieldUF;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTelefone;
@property (weak, nonatomic) IBOutlet UISwitch *switchAlvenaria;
@property (weak, nonatomic) IBOutlet UISwitch *switchChaveiro;
@property (weak, nonatomic) IBOutlet UISwitch *switchEletrica;
@property (weak, nonatomic) IBOutlet UISwitch *switchHidraulica;
@property (weak, nonatomic) IBOutlet UISwitch *switchJardinagem;
@property (weak, nonatomic) IBOutlet UISwitch *switchPintura;


@end

@implementation HOOCadastroProffisionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionSave:(id)sender {
    NSLog(@"Cadastro do Profissional relaizado com sucesso");
}
@end
