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

    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    [query whereKey:@"objectId" equalTo:self.idServico];
    PFObject *object =[query getFirstObject];

    self.labelTipo.text = object[@"tipo"];
    self.labelDateAndHour.text = [NSString stringWithFormat: @"Date: %@", object[@"dataServico"]];
    self.textViewDescricao.text = object[@"descricao"];
    
    self.arrayListaPro = [[NSArray alloc] initWithArray:object[@"proCandidatos"]];
    
    self.textViewDescricao.editable = NO;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return [self.arrayListaPro count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellPro"];
    cell.textLabel.text = [self.arrayListaPro objectAtIndex:indexPath.row];
    return cell;
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

@end
