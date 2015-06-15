//
//  HOOServicosDisponiveisViewController.h
//  Hooli
//
//  Created by Lúcio Barros on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HOOServicosDisponiveisViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSArray *arrayServicos;

- (IBAction)logout:(id)sender;

@end
