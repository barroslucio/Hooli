//
//  HOOHistóricoClienteViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOHistoricoClienteViewController.h"

@interface HOOHistoricoClienteViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *arrayServicos;
@end

@implementation HOOHistoricoClienteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initProperties];
    
}

- (void)initProperties{
   

}


//TABLE VIEW
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    [query whereKey:@"User" equalTo:[PFUser currentUser]];
    NSArray *servicos = [query findObjects];
    cell.textLabel.text = [servicos[indexPath.row] objectForKey:@"endereco"];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    [query whereKey:@"User" equalTo:[PFUser currentUser]];
    NSArray *servicos = [query findObjects];
    return servicos.count;
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
