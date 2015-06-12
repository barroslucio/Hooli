//
//  HOOAgendaOutroEnderecoViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOAgendaOutroEnderecoViewController.h"

@interface HOOAgendaOutroEnderecoViewController ()
{
    NSString *strDate;
    NSString *strInvertedDate;
    NSString *strTime;
    NSString *strComb;
    NSString *tipoServico;
}
@end

@implementation HOOAgendaOutroEnderecoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.myDatePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    [self.myTimePicker addTarget:self action:@selector(timePickerChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.myDatePicker.minimumDate = [NSDate date];
    
    if (self.tipoDeServico == 1){
        [self.servico setText:@"Tipo de serviço: Alvenaria"];
        tipoServico = @"Alvenaria";
    }
    else if (self.tipoDeServico == 2){
        [self.servico setText:@"Tipo de serviço: Chaveiro"];
        tipoServico = @"Chaveiro";
    }
    else if (self.tipoDeServico == 3){
        [self.servico setText:@"Tipo de serviço: Elétrica"];
        tipoServico = @"Elétrica";
    }
    else if (self.tipoDeServico == 4){
        [self.servico setText:@"Tipo de serviço: Hidráulica"];
        tipoServico = @"Hidráulica";

    }
    else if (self.tipoDeServico == 5){
        [self.servico setText:@"Tipo de serviço: Limpeza"];
        tipoServico = @"Limpeza";

    }
    else if (self.tipoDeServico == 6){
        [self.servico setText:@"Tipo de serviço: Pintura"];
        tipoServico = @"Pintura";

    }
    
    NSLog(@"%d",self.tipoDeServico);
    
    


}

-(void) datePickerChanged: (UIDatePicker *)datePicker{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *invertedDateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    [invertedDateFormatter setDateFormat:@"yyyy-MM-dd"];

   strDate = [dateFormatter stringFromDate:datePicker.date];
    strInvertedDate = [invertedDateFormatter stringFromDate:datePicker.date];

    self.selectedDate.text = [NSString stringWithFormat:@"Data do serviço: %@",strDate];

}

-(void) timePickerChanged: (UIDatePicker *)datePicker{
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"HH:mm"];
    strTime = [timeFormatter stringFromDate:datePicker.date];
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


    
-(void)combina{
    

    NSLog(@" \ndate : %@ \ntime : %@\n \ninverted date : %@\n",strDate,strTime, strInvertedDate);
}

- (IBAction)agendaServico:(id)sender {
    PFObject *servico = [PFObject objectWithClassName:@"Servico"];
    [servico setObject:[PFUser currentUser] forKey:@"User"];
    servico[@"endereco"] = self.enderecoField.text;
    servico[@"descricao"] = self.descricaoField.text;
    servico[@"dataServico"] = strInvertedDate;
    servico[@"tipo"] = tipoServico;

    
    [servico saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            [self combina];
        } else {
            // There was a problem, check error.description
        }
    }];
    
}
@end
