//
//  ViewController.h
//  Hooli
//
//  Created by Lúcio Barros on 08/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "UIFloatLabelTextField.h"

@interface HOOLoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextField *senhaField;
@property (strong, nonatomic) IBOutlet UIView *subviewEmail;
@property (strong, nonatomic) IBOutlet UIView *subviewSenha;

- (IBAction)login:(id)sender;

@end

