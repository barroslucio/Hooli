//
//  HOOPerfilProfissionalViewController.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/15/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface HOOPerfilProfissionalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lbEmail;
@property (weak, nonatomic) IBOutlet UILabel *lbSenha;
@property (weak, nonatomic) IBOutlet UILabel *lbDDD;
@property (weak, nonatomic) IBOutlet UILabel *lbTelefone;
@property (weak, nonatomic) IBOutlet UILabel *lbCidade;
@property (weak, nonatomic) IBOutlet UILabel *lbEstado;
@property (weak, nonatomic) IBOutlet UILabel *lbEndereco;
@property (weak, nonatomic) IBOutlet UISwitch *swAlvenaria;
@property (weak, nonatomic) IBOutlet UISwitch *swChaveiro;
@property (weak, nonatomic) IBOutlet UISwitch *swEletrica;
@property (weak, nonatomic) IBOutlet UISwitch *swHidraulica;
@property (weak, nonatomic) IBOutlet UISwitch *swLimpeza;
@property (weak, nonatomic) IBOutlet UISwitch *swPintura;

@end
