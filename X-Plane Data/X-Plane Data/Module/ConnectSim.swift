//
//  ConnectSim.swift
//  X-Plane Data
//
//  Created by Jerry on 4/25/19.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import Foundation

public var posiArray: Array<Float> = []

class XPConnect {
    class func getAirplanePOSI() {
        let sock: XPCSocket = openUDP(simIP)
        var values: [Float] = [0,0,0,0,0,0,0]
        getPOSI(sock, &values, 0)
        posiArray = values
    }

}
