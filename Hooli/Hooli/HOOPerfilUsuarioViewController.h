//
//  HOOPerfilUsuarioViewController.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/11/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HOOPerfilUsuarioViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *respEmailLabel;
@property (weak, nonatomic) IBOutlet UILabel *respSenhaLabel;
@property (weak, nonatomic) IBOutlet UILabel *respDDDLabel;
@property (weak, nonatomic) IBOutlet UILabel *respTelefoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *respCidadeLabel;
@property (weak, nonatomic) IBOutlet UILabel *respEstadoLabel;
@property (weak, nonatomic) IBOutlet UILabel *respEnderecoLabel;

- (IBAction)editButton:(id)sender;

@end
