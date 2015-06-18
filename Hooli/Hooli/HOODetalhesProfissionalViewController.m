//
//  HOODetalhesProfissionalViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/17/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOODetalhesProfissionalViewController.h"

@interface HOODetalhesProfissionalViewController () <UIActionSheetDelegate>

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
    // query para a proposta
    PFQuery *query = [PFQuery queryWithClassName:@"Proposta"];
    [query whereKey:@"objectId" equalTo:self.idProposta];
    PFObject *objectProposta =[query getFirstObject];

    // acessa o id do profissional que mandou a proposta
    PFObject *profissional = (PFObject *) objectProposta[@"profissional"];
    
    // query para as informações do profissional
    PFQuery *query2 = [PFQuery queryWithClassName:@"_User"];
    [query2 whereKey:@"objectId" equalTo:[profissional objectId]];
    
    // object para o usuário
    PFObject *usuario =[query2 getFirstObject];
    self.lbNome.text = usuario[@"username"];
    self.lbEndereco.text = usuario[@"endereco"];
    self.lbEstado.text = usuario[@"estado"];
    self.lbCidade.text = usuario[@"cidade"];
}




- (IBAction)confirmar:(id)sender
{
    [self alerta];
    
}

-(void)alerta
{
    
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Deseja contratar?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Sim",
                            @"Não",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
//                    [self performSegueWithIdentifier:@"Sim" sender:self];
                    break;
                case 1:
//                    [self performSegueWithIdentifier:@"Não" sender:self];
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    
}



@end
