//
//  HOODetalhesServicoClienteViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 13/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOODetalhesServicoClienteViewController.h"

@interface HOODetalhesServicoClienteViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) NSArray *arrayListaPro;
@end

@implementation HOODetalhesServicoClienteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *propostas;
    
    // query para o serviço
    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    [query whereKey:@"objectId" equalTo:self.idServico];
    PFObject *object =[query getFirstObject];

    self.labelTipo.text = object[@"tipo"];
    self.labelDateAndHour.text = [NSString stringWithFormat: @"Date: %@", object[@"dataServico"]];
    self.textViewDescricao.text = object[@"descricao"];
    

    
    PFQuery *propostasFeitas = [PFQuery queryWithClassName:@"Proposta"];
    propostas = [propostasFeitas findObjects];
    NSMutableArray *servicesToFilter = [@[] mutableCopy];
    for (NSDictionary *object in propostas) {
        
    PFObject *servico = (PFObject *) object[@"servico"];
        if([self.idServico isEqual:[servico objectId]])
        {
            [servicesToFilter addObject:object];
        }
    }
    
    self.arrayListaPro = servicesToFilter;
    NSLog(@"%ld", self.arrayListaPro.count);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return [self.arrayListaPro count];
//    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellPro"];
    cell.textLabel.text = [[self.arrayListaPro[indexPath.row] objectForKey:@"valor"] stringValue];
//    cell.textLabel.text = @"--";
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
