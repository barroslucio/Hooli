//
//  HOOEditProfissionalViewController.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/15/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "HOOPerfilProfissionalViewController.h"

@interface HOOEditProfissionalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfSenha;
@property (weak, nonatomic) IBOutlet UITextField *tfDDD;
@property (weak, nonatomic) IBOutlet UITextField *tfTelefone;
@property (weak, nonatomic) IBOutlet UITextField *tfCidade;
@property (weak, nonatomic) IBOutlet UITextField *tfEstado;
@property (weak, nonatomic) IBOutlet UITextField *tfEndereco;

- (IBAction)saveButton:(id)sender;

@end
