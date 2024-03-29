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

public var simIP: String = "192.168.32.6"

class ViewController: UIViewController {
    
    @IBOutlet weak var mainMapView: MKMapView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var ALTLabel: UILabel!
    @IBOutlet weak var connectBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainMapView.delegate = self
        
        //Blur Effect to show ALT
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        infoView.backgroundColor = .clear
        infoView.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: infoView.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: infoView.widthAnchor),
            ])
        //Custom Connect Button Layer
        connectBtn.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        connectBtn.layer.borderWidth = 2
        connectBtn.layer.cornerRadius = 10
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController.getACPosition), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController.addAircraftAnnotation), userInfo: nil, repeats: true)
        
    }
    
    
    func initCenterView() {
        
        let currentLocationSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let centerView = CLLocationCoordinate2D(latitude:Double(posiArray[0]) , longitude: Double(posiArray[1]))
        let currentRegion: MKCoordinateRegion = MKCoordinateRegion(center: centerView, span: currentLocationSpan)
        self.mainMapView.setRegion(currentRegion, animated: true)
    }
    
    
    
    @objc func getACPosition() {
        XPConnect.getAirplanePOSI()
        let ALT = posiArray[2]
        print(posiArray)
        ALTLabel.text = "\(ALT) m"
       
    }
    
    func removePin() {
        for annotation in mainMapView.annotations {
            mainMapView.removeAnnotation(annotation)
        }
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
            simIP = enterIP.text!

        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func backToCurrentPOSIPressed(_ sender: Any) {
        initCenterView()
    }

}

extension ViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotaionView = mapView.dequeueReusableAnnotationView(withIdentifier: "planeAnnotation")
        if annotaionView == nil {
            annotaionView = MKAnnotationView(annotation: annotation, reuseIdentifier: "planeAnnotation")
        } else {
            annotaionView!.annotation = annotation
        }
        annotaionView!.image = #imageLiteral(resourceName: "airplane_red")
        return annotaionView
    }

    @objc func addAircraftAnnotation() {
        removePin()
        XPConnect.getAirplanePOSI()
        let LAT: CLLocationDegrees = Double(posiArray[0])
        let LON: CLLocationDegrees = Double(posiArray[1])
        let coordinate = CLLocationCoordinate2D(latitude:LAT, longitude:LON)
        let annotation = AircraftPin(coordinate: coordinate, identifier: "planeAnnotation")
        self.mainMapView.addAnnotation(annotation)
    }
}

