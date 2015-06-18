//
//  HOODetalhesProfissionalViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/17/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOODetalhesProfissionalViewController.h"

@interface HOODetalhesProfissionalViewController ()

@end

@implementation HOODetalhesProfissionalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self mostraDadosProfissional];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


- (void)mostraDadosProfissional
{
    //HOODetalhesServicoClienteViewController *detalhe = [[HOODetalhesServicoClienteViewController alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    [query getObjectInBackgroundWithId:self.idProfissional block:^(PFObject *object, NSError *error)
    {
        self.lbEndereco.text = object[@"endereco"];
        self.lbEstado.text = object[@"estado"];
    }];

}


- (IBAction)confirmar:(id)sender
{
    
}
@end
