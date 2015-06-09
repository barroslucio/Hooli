//
//  HOOClienteViewController.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/9/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HOOCliente.h"

@interface HOOClienteViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nomeField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *senhaField;
@property (weak, nonatomic) IBOutlet UITextField *telefoneField;
@property (weak, nonatomic) IBOutlet UITextField *cpfField;
@property (weak, nonatomic) IBOutlet UITextField *cidadeField;
@property (weak, nonatomic) IBOutlet UITextField *estadoField;

//ARRAY DE ESTADOS
@property (nonatomic) NSArray* arrayUF;

- (IBAction)saveButton:(id)sender;

@end
