//
//  HOOAgendaOutroEnderecoViewController.h
//  Hooli
//
//  Created by Lúcio Barros on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface HOOAgendaOutroEnderecoViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *selectedDate;
@property (strong, nonatomic) IBOutlet UILabel *selectedTime;
@property (strong, nonatomic) IBOutlet UILabel *servico;


@property (strong, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *myTimePicker;


@property (retain, nonatomic)  UIDatePicker *pickerDate;
@property (retain, nonatomic)  UIDatePicker *pickerTime;


@property (nonatomic) NSString *hora;
@property (nonatomic) NSString *data;
@property (nonatomic) int tipoDeServico;


@property (strong, nonatomic) IBOutlet UITextView *descricaoField;
@property (strong, nonatomic) IBOutlet UITextField *enderecoField;


@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTime;


- (IBAction)agendaServico:(id)sender;

@end
