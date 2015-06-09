//
//  HOOUsuarioProfissional.h
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 08/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HOOUsuarioProfissional : NSObject

@property (nonatomic, copy) NSString* nome;
@property (nonatomic, copy) NSString* email;
@property (nonatomic, copy) NSString* senha;
@property (nonatomic, copy) NSString* endereco;
@property (nonatomic, copy) NSString* cidade;
@property (nonatomic, copy) NSString* uf;

@property (nonatomic, copy) NSNumber* telefone;
@property (nonatomic, copy) NSNumber* rg;
@property (nonatomic, copy) NSNumber* cpf;
@property (nonatomic, copy) NSNumber* ddd;

@property (nonatomic) BOOL alvenaria;
@property (nonatomic) BOOL chaveiro;
@property (nonatomic) BOOL eletrica;
@property (nonatomic) BOOL hidraulica;
@property (nonatomic) BOOL limpeza;
@property (nonatomic) BOOL pintura;


@end
