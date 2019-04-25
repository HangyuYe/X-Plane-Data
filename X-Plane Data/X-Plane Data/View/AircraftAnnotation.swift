//
//  AircraftAnnotation.swift
//  X-Plane Data
//
//  Created by Jerry on 2019/4/26.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import Foundation
import MapKit

class AircraftAnnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
    
//    class func updateAircraftPOSI(annotationPOSI annotation: AircraftAnnotation, withCoordinate coordinate: CLLocationCoordinate2D) {
//        var location = self.coordinate
//        location.latitude = coordinate.latitude
//        location.longitude = coordinate.longitude
//        UIView.animate(withDuration: 1) {
//            self.coordinate = location
//        }
//    }
}

