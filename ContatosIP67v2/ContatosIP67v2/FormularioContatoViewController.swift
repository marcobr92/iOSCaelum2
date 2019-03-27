//
//  ViewController.swift
//  ContatosIP67
//
//  Created by ios8106 on 19/03/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import UIKit
import CoreLocation

class FormularioContatoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if contato != nil{
            self.nome.text = contato.nome
            self.telefone.text = contato.telefone
            self.endereco.text = contato.endereco
            self.siteText.text = contato.site
            self.longitude.text = contato.longitude?.description
            self.latitude.text = contato.latitude?.description
            
            if let foto = self.contato.foto{
                self.imageView.image = foto
            }
            
            let botaoAlterar: UIBarButtonItem = UIBarButtonItem(title: "Confirmar", style: .plain, target: self, action: #selector(atualizaContato))
            self.navigationItem.rightBarButtonItem = botaoAlterar
            
            
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(selecionarFoto(sender:)))
        self.imageView.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var nome: UITextField!
    @IBOutlet var telefone: UITextField!
    @IBOutlet var endereco: UITextField!
    @IBOutlet var siteText: UITextField!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var latitude: UITextField!
    @IBOutlet var longitude: UITextField!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    
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
        
//        if self.botaoAdicionaImage.backgroundImageForState(.Normal) != nil{
//            self.contato.foto = self.botaoAdicionaImage.backgroundImageForState(.Normal)
//        }
        
        self.contato.nome = self.nome.text!
        self.contato.telefone = self.telefone.text!
        self.contato.endereco = self.endereco.text!
        self.contato.site = self.siteText.text!
        self.contato.foto = self.imageView.image

        
        
        if let latitude = Double(self.latitude.text!){
            self.contato.latitude = latitude as NSNumber
        }
        
        if let longitude = Double(self.longitude.text!){
            self.contato.longitude = longitude as NSNumber
        }
    }
    
    var delegate:FormularioContatoViewControllerDelegate?
    
    func atualizaContato(){
        pegaDadosDoFormulario()
        
        self.delegate?.contatoAtualizado(contato)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func criaContato(){
        self.pegaDadosDoFormulario()
        dao.adiciona(contato)
        
        self.delegate?.contatoAdicionado(contato)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func selecionarFoto(sender: AnyObject){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            //camera ok
        }else {
            //usa biblioteca
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            //14.2
            if let imagemSelecionada = info[UIImagePickerControllerEditedImage] as? UIImage{
                self.imageView.image = imagemSelecionada
            }
            picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
    }
    
    @IBAction func bucarCoordenadas(sender: UIButton){
        self.loading.startAnimating()
        sender.isEnabled = false
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(self.endereco.text!){(resultado, error) in
            if error == nil && (resultado?.count)! > 0{
                let placemark = resultado![0]
                let coordenada = placemark.location!.coordinate
                self.latitude.text = coordenada.latitude.description
                self.longitude.text = coordenada.longitude.description
                self.loading.stopAnimating()
                sender.isEnabled = true
            }
        }
    }

    
}

