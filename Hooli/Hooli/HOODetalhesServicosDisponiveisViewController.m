//
//  HOODetalhesServicosDisponiveisViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOODetalhesServicosDisponiveisViewController.h"

@interface HOODetalhesServicosDisponiveisViewController ()

@end

@implementation HOODetalhesServicosDisponiveisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   [self initProperties];
    NSLog(@"%@",self.servico);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initProperties
{
    
            self.tipoServico.text = self.servico[@"tipo"];
            self.dataServico.text = self.servico[@"dataServico"];
 
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)enviarProposta:(id)sender {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *valor = [formatter numberFromString:self.valorField.text];
    
    PFObject *proposta = [PFObject objectWithClassName:@"Proposta"];
    [proposta setObject: [PFUser currentUser] forKey:@"profissional"];
    [proposta setObject: self.servico forKey:@"servico"];
    [proposta setObject: valor forKey:@"valor"];
    [proposta saveInBackground];
}
@end
