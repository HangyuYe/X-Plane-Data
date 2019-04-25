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
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var ALTLabel: UILabel!
    @IBOutlet weak var connectBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        infoView.backgroundColor = .clear
        infoView.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: infoView.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: infoView.widthAnchor),
            ])
        connectBtn.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        connectBtn.layer.borderWidth = 2
        connectBtn.layer.cornerRadius = 10
        
        
        //Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.frashPOSI), userInfo: nil, repeats: true)
    }
    
    
    func initMKParameter() {
        let latDelta = 0.05
        let longDelta = 0.05
        
        let currentLocationSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let centerView: CLLocation = CLLocation(latitude:Double(getPlaneLAT()) , longitude: Double(getPlaneLON()))
        let currentRegion: MKCoordinateRegion = MKCoordinateRegion(center: centerView.coordinate, span: currentLocationSpan)
        
        self.mainMapView.setRegion(currentRegion, animated: true)
    }
    
    func initPlanPOSI() {
        
        let center = CLLocationCoordinate2DMake(Double(getPlaneLAT()), Double(getPlaneLON()))
        let currentPOSI = MKPointAnnotation()
        currentPOSI.coordinate = center
        currentPOSI.title = "当前位置"
        self.mainMapView.addAnnotation(currentPOSI)
    }
    

    
    // Print current IP address on screen for connect X-Plane needs
    
    @IBAction func infoBtnPressed(_ sender: Any) {
        let address: String = getLocalIPAddress()!
        let alert = UIAlertController(title: "当前的IP地址", message: address, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "好", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func connectBtnPressed(_ sender: Any) {
        let alert = UIAlertController(title: "IP Address", message: "Please enter your simulator IP", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "192.168.1.1"
        }
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            let enterIP = alert.textFields!.first!
            print(enterIP.text!)
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

