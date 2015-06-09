//
//  HOOCliente.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/9/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HOOCliente : NSObject

@property(nonatomic, retain) NSString *nome;
@property(nonatomic, retain) NSString *email;
@property(nonatomic, retain) NSString *senha;
@property(nonatomic, retain) NSNumber *telefone;
@property(nonatomic, retain) NSNumber *cpf;
@property(nonatomic, retain) NSString *cidade;
@property(nonatomic, retain) NSString *estado;
@property(nonatomic, retain) NSString *endereco;
@property(nonatomic, retain) NSNumber *rg;

@end
