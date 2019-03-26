//
//  ContatosNoMapaViewController.swift
//  ContatosIP67v2
//
//  Created by ios8106 on 25/03/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class ContatosNoMapaViewController: UIViewController {
    @IBOutlet weak var mapa: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestWhenInUseAuthorization()
        let botaoLocalizacao = MKUserTrackingBarButtonItem(mapView: self.mapa)
        self.navigationItem.rightBarButtonItem = botaoLocalizacao
    }
    
    override func didReceiveMemoryWarning() {
        //
    }
}
