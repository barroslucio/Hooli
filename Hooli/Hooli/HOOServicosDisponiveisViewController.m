//
//  HOOServicosDisponiveisViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOServicosDisponiveisViewController.h"
#import "HOOLoginViewController.h"
#import <Parse/Parse.h>
#import "HOOServicosDisponiveisTVCell.h"
#import "HOODetalhesServicosDisponiveisViewController.h"

@interface HOOServicosDisponiveisViewController ()

@end

@implementation HOOServicosDisponiveisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initProperties];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initProperties
{
    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    //[query whereKey:@"tipo" equalTo:@"Alvenaria"];
    self.arrayServicos = [query findObjects];
}

//TABLE VIEW
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HOOServicosDisponiveisTVCell   *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.tipoServico.text = [self.arrayServicos[indexPath.row] objectForKey:@"tipo"];
    cell.dataServico.text = [self.arrayServicos[indexPath.row] objectForKey:@"dataServico"];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayServicos.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //pega o indice da linha que ofi clidade na tablea.
    NSIndexPath *indexPath = [self.tableview indexPathForSelectedRow];
    //envia essa informacao para EditViewController.
    HOODetalhesServicosDisponiveisViewController *destination = segue.destinationViewController;
    destination.servico = [self.arrayServicos objectAtIndex:indexPath.row];
}

- (IBAction)logout:(id)sender {
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser];
    if (!currentUser){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HOOLoginViewController *viewController = (HOOLoginViewController *)[storyboard instantiateViewControllerWithIdentifier:@"login"];
        [self presentViewController:viewController animated:YES completion:nil];
    }
}

@end
