//
//  ContatoDAO.swift
//  ContatosIP67v2
//
//  Created by ios8106 on 19/03/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import UIKit

class ContatoDAO: NSObject {

    static private var defaultDAO: ContatoDAO!
    var contatos: Array<Contato>
    
    func adiciona(_ contato: Contato) {
        contatos.append(contato)
        for umContato in contatos {
            print(umContato)
        }
    }
    
    static func sharedInstance() -> ContatoDAO {
        if defaultDAO == nil {
            defaultDAO = ContatoDAO()
        }
        return defaultDAO
    }
    
    override private init() {
        self.contatos = Array()
        super.init()
    }
    
    func listaTodos() -> [Contato]{
        return contatos
    }
    
    func buscaContatoNaPosicao(_ posicao:Int) -> Contato {
        return contatos[posicao]
    }
    
    func remove(_ posicao:Int){
        contatos.remove(at: posicao)
    }
    
    func buscaPosicaoDoContato(_ contato:Contato) -> Int {
        return contatos.index(of: contato)!
    }
}
