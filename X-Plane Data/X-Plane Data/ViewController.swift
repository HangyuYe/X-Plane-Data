//
//  ViewController.swift
//  X-Plane Data
//
//  Created by Jerry on 4/14/19.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import UIKit
import MapKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var mainMapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initMKParameterP()
    }
    
    func initMKParameterP() {
        let latDelta = 0.5
        let longDelta = 0.5
        
        let currentLocationSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let centerView: CLLocation = CLLocation(latitude: 24.879, longitude: 102.833)
        let currentRegion: MKCoordinateRegion = MKCoordinateRegion(center: centerView.coordinate, span: currentLocationSpan)
        
        self.mainMapView.setRegion(currentRegion, animated: true)
    }
    
    @IBAction func infoBtnPressed(_ sender: Any) {
        let address: String = getLocalIPAddress()!
        let alert = UIAlertController(title: "当前的IP地址", message: address, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "好", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

