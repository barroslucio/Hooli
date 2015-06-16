//
//  HOOHistoricoServicosProfissionalViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOHistoricoServicosProfissionalViewController.h"

@interface HOOHistoricoServicosProfissionalViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *arrayServicos;

@end

@implementation HOOHistoricoServicosProfissionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initProperties];
}
- (void)initProperties{
    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    [query whereKey:@"proEscolhido" equalTo:[PFUser currentUser]];
    self.arrayServicos = [query findObjects];
}
//TABLE VIEW
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = @"tipo";
    cell.detailTextLabel.text = @"dataServico";

//    cell.textLabel.text = [self.arrayServicos[indexPath.row] objectForKey:@"tipo"];
//    cell.detailTextLabel.text = [self.arrayServicos[indexPath.row] objectForKey:@"dataServico"];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.arrayServicos.count;
    return 4;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    HOODetalhesHistoricoServicoProfissionalViewController *destinationViewController = [segue destinationViewController];
//    
//    
//    if ([segue.identifier isEqual:@"segueDetalhes"]) {
//        
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSString *idServico = [self.arrayServicos[indexPath.row] objectId];
//        
//        destinationViewController.idServico = idServico;
//    } else {
//        destinationViewController.idServico = nil;
//        
//    }
//}


@end
