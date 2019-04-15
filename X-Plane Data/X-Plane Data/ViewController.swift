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
        let latDelta = 0.5
        let longDelta = 0.5
        let currentLocationSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let centerView: CLLocation = CLLocation(latitude: 24.879, longitude: 102.833)
        let currentRegion: MKCoordinateRegion = MKCoordinateRegion(center: centerView.coordinate, span: currentLocationSpan)
        
        self.mainMapView.setRegion(currentRegion, animated: true)
    }
    
    


}

