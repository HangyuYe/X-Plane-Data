//
//  AircraftAnnotation.swift
//  X-Plane Data
//
//  Created by Jerry on 2019/4/26.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import Foundation
import MapKit

class AircraftPin: NSObject, MKAnnotation {
    dynamic var coordinate: CLLocationCoordinate2D
    var identifier: String
    
    init(coordinate: CLLocationCoordinate2D, identifier: String) {
        self.coordinate = coordinate
        self.identifier = identifier
        super.init()
    }

}

