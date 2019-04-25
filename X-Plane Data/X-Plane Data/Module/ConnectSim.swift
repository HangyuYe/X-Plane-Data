//
//  ConnectSim.swift
//  X-Plane Data
//
//  Created by Jerry on 4/25/19.
//  Copyright © 2019 SoftChain Foundation Ltd. All rights reserved.
//

import Foundation

func getAirPlaneLAT() {
    let sock: XPCSocket = openUDP(simIP)
    var values: UnsafeMutablePointer<Float>?
    getPOSI(sock, values, 0)
    print(values ?? 0)
    
}
