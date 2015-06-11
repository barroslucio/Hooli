//
//  HOOPerfilUsuarioViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/11/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOPerfilUsuarioViewController.h"

@interface HOOPerfilUsuarioViewController ()

@end

@implementation HOOPerfilUsuarioViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

// procedimento para pegar as informações do cliente no parse
- (void)buscaDadosClienteParse
{
    // variável para pegar as informações
    PFUser *user = [PFUser currentUser];
    
    self.respEnderecoLabel.text = user[@"endereco"];
    
}


- (IBAction)editButton:(id)sender
{
    
}
@end
