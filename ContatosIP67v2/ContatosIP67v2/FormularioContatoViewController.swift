//
//  ViewController.swift
//  ContatosIP67
//
//  Created by ios8106 on 19/03/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import UIKit

class FormularioContatoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if contato != nil{
            self.nome.text = contato.nome
            self.telefone.text = contato.telefone
            self.endereco.text = contato.endereco
            self.siteText.text = contato.site
            
            let botaoAlterar = UIBarButtonItem(title: "Confirmar", style: .plain, target: self, action: #selector(atualizaContato))
            self.navigationItem.rightBarButtonItem = botaoAlterar
            
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var nome: UITextField!
    @IBOutlet var telefone: UITextField!
    @IBOutlet var endereco: UITextField!
    @IBOutlet var siteText: UITextField!
    
    
    var dao:ContatoDAO
    
    required init?(coder aDecoder: NSCoder) {
        self.dao = ContatoDAO.sharedInstance()
        super.init(coder: aDecoder)
    }
    
    var contato: Contato!
    
//    func criaContato(){
//        self.pegaDadosDoFormulario()
//        dao.adiciona(contato)
//    }
    
//   @IBAction func pegaDadosDoFormulario() {
    func pegaDadosDoFormulario() {
        
//        let contato: Contato = Contato()
//        
//        contato.nome = self.nome.text!
//        contato.telefone = self.telefone.text!
//        contato.endereco = self.endereco.text!
//        contato.site = self.siteText.text!
//        
//        dao.adiciona(contato)
        
        if contato == nil{
            self.contato = Contato()
        }
        
        self.contato.nome = self.nome.text!
        self.contato.telefone = self.telefone.text!
        self.contato.endereco = self.endereco.text!
        self.contato.site = self.siteText.text!
    }
    
    func atualizaContato(){
        pegaDadosDoFormulario()
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func criaContato(){
        self.pegaDadosDoFormulario()
        dao.adiciona(contato)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}

