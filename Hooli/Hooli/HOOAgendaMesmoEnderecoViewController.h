//
//  HOOAgendaMesmoEnderecoViewController.h
//  Hooli
//
//  Created by Lúcio Barros on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface HOOAgendaMesmoEnderecoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *servico;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTime;

@property (weak, nonatomic) IBOutlet UITextView *descricaoField;

- (IBAction)agendaServico:(id)sender;

@property (retain, nonatomic)  UIDatePicker *pickerDate;
@property (retain, nonatomic)  UIDatePicker *pickerTime;

@property (nonatomic) NSString *hora;
@property (nonatomic) NSString *data;
@property (nonatomic) int tipoDeServico;
- (IBAction)voltar:(id)sender;

@end
