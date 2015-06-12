//
//  HOOAgendaOutroEnderecoViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOAgendaOutroEnderecoViewController.h"

@interface HOOAgendaOutroEnderecoViewController ()

@end

@implementation HOOAgendaOutroEnderecoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.myDatePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    [self.myTimePicker addTarget:self action:@selector(timePickerChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.myDatePicker.minimumDate = [NSDate date];
    
    if (self.tipoDeServico == 1){
        [self.servico setText:@"Tipo de serviço: Hidraulica"];
    }
    else if (self.tipoDeServico == 2){
        [self.servico setText:@"Tipo de serviço: Pintura"];
    }
    else if (self.tipoDeServico == 3){
        [self.servico setText:@"Tipo de serviço: Limpeza"];
    }
    else if (self.tipoDeServico == 4){
        [self.servico setText:@"Tipo de serviço: Chaveiro"];
    }
    else if (self.tipoDeServico == 5){
        [self.servico setText:@"Tipo de serviço: Elétrica"];
    }
    else if (self.tipoDeServico == 6){
        [self.servico setText:@"Tipo de serviço: Limpeza"];
    }
    
    NSLog(@"%d",self.tipoDeServico);

}

-(void) datePickerChanged: (UIDatePicker *)datePicker{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
    self.selectedDate.text = [NSString stringWithFormat:@"Data do serviço: %@",strDate];

}

-(void) timePickerChanged: (UIDatePicker *)datePicker{
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"hh:mm"];
    NSString *strTime = [timeFormatter stringFromDate:datePicker.date];
    self.selectedTime.text = [NSString stringWithFormat:@"Hora do serviço: %@",strTime];
    
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

- (IBAction)agendaServico:(id)sender {
    PFObject *servico = [PFObject objectWithClassName:@"Servico"];
    [servico setObject:[PFUser currentUser] forKey:@"User"];
    servico[@"endereco"] = self.enderecoField.text;
    servico[@"descricao"] = self.descricaoField.text;
    [servico saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
    
}
@end
