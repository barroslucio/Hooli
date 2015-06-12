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
@property (strong, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (nonatomic) int tipoDeServico;
@property (strong, nonatomic) IBOutlet UILabel *selectedTime;
@property (strong, nonatomic) IBOutlet UIDatePicker *myTimePicker;
- (IBAction)agendaServico:(id)sender;
@property (nonatomic) NSString *hora;
@property (nonatomic) NSString *data;
@property (strong, nonatomic) IBOutlet UILabel *servico;
@property (strong, nonatomic) IBOutlet UITextField *enderecoField;
@property (strong, nonatomic) IBOutlet UITextView *descricaoField;

@end
