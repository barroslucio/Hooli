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
    
    UITableViewCell   *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [self.arrayServicos[indexPath.row] objectForKey:@"tipo"];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayServicos.count;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

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
