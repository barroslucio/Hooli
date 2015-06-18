//
//  HOOEscolhaCadastroViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 18/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOEscolhaCadastroViewController.h"

@interface HOOEscolhaCadastroViewController ()

@end

@implementation HOOEscolhaCadastroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.layer.cornerRadius = 20.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

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
