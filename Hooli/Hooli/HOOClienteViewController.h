//
//  HOOClienteViewController.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/9/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "UIFloatLabelTextField.h"

@interface HOOClienteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *senhaField;
@property (weak, nonatomic) IBOutlet UITextField *telefoneField;
@property (weak, nonatomic) IBOutlet UITextField *cidadeField;
@property (weak, nonatomic) IBOutlet UITextField *estadoField;
@property (weak, nonatomic) IBOutlet UITextField *enderecoField;
@property (strong, nonatomic) IBOutlet UITextField *dddField;
@property (strong, nonatomic) IBOutlet UIView *subviewEstado;
@property (strong, nonatomic) IBOutlet UIView *subviewCidade;
@property (strong, nonatomic) IBOutlet UIView *subviewEndereco;
@property (strong, nonatomic) IBOutlet UIView *subviewDDD;
@property (strong, nonatomic) IBOutlet UIView *subviewTelefone;
@property (strong, nonatomic) IBOutlet UIView *subviewSenha;
@property (strong, nonatomic) IBOutlet UIView *subviewEmail;

//ARRAY DE ESTADOS
@property (nonatomic) NSArray* arrayUF;

//PIKER VIEW
@property (retain, nonatomic)  UIPickerView *pickerView;

- (IBAction)saveButton:(id)sender;

@end
