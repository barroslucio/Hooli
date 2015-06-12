//
//  HOOEditUsuarioViewController.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/12/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface HOOEditUsuarioViewController : UIViewController

- (IBAction)saveChangesButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tfRespEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfRespSenha;
@property (weak, nonatomic) IBOutlet UITextField *tfRespDDD;
@property (weak, nonatomic) IBOutlet UITextField *tfRespTelefone;
@property (weak, nonatomic) IBOutlet UITextField *tfRespEstado;
@property (weak, nonatomic) IBOutlet UITextField *tfRespEndereco;
@property (weak, nonatomic) IBOutlet UITextField *tfRespCidade;

@end
