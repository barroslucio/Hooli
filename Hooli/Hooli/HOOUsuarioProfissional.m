//
//  HOOUsuarioProfissional.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 08/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOUsuarioProfissional.h"

@implementation HOOUsuarioProfissional
-(id)initWith : (NSDictionary*) dic{
    self = [super init];
    
    _nome = [dic objectForKey:@"nome"];
    _email = [dic objectForKey:@"email"];
    _senha = [dic objectForKey:@"senha"];
    _endereco = [dic objectForKey:@"endereco"];
    _cidade = [dic objectForKey:@"cidade"];
    _uf = [dic objectForKey:@"uf"];
    _telefone = [dic objectForKey:@"telefone"];
    _alvenaria = FALSE;
    _chaveiro = FALSE;
    _eletrica = FALSE;
    _hidraulica = FALSE;
    _limpeza = FALSE;
    _pintura = FALSE;
    
    return self;
}

@end
