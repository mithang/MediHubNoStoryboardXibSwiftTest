//
//  ViewController.swift
//  MediHubNoStoryboardXibSwift
//
//  Created by apple on 12/19/17.
//  Copyright © 2017 appledemoobj. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var lbtitle: UILabel!
    var btnRegister: UIButton!
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    let heightUI: CGFloat = 50
    let distanceSpan: Double = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initUI()

    }
    func initUI(){
        
        lbtitle = UILabel()
        lbtitle.text = "Điền thông tin bên dưới"
        lbtitle.frame = CGRect(x: 0, y: 44, width: self.view.bounds.width, height: heightUI)
        lbtitle.backgroundColor = UIColor.red
        lbtitle.textAlignment = NSTextAlignment.center
        self.view.addSubview(lbtitle)
        
        btnRegister = UIButton()
        btnRegister.setTitle("TRUY CẬP ĐỊA CHỈ", for: .normal)
        btnRegister.frame = CGRect(x: 0, y: lbtitle.frame.origin.y + heightUI, width: self.view.bounds.width, height: heightUI)
        btnRegister.backgroundColor = UIColor.blue
        //btnRegister.sizeToFit() -> Không phụ thuộc frame, mà tự co giãn đúng bằng kích thước chứa nội dung bên trong
        btnRegister.addTarget(self, action: #selector(onRegister), for: .touchUpInside)
        self.view.addSubview(btnRegister)
        
        mapView = MKMapView()
        mapView.frame = CGRect(x: 0, y: btnRegister.frame.origin.y + heightUI, width: self.view.bounds.width, height: self.view.bounds.height-btnRegister.frame.origin.y)
        mapView.showsUserLocation = true
        self.view.addSubview(mapView)
    }
    
    @objc func onRegister(sender:UIButton!){
        mapView.showsUserLocation = true
        mapView.userLocation.title="Day la vi tri cua toi"
        /*self.locationManager = CLLocationManager()
        if let locationManager = self.locationManager {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager.requestAlwaysAuthorization()
            locationManager.distanceFilter = 50
            locationManager.startUpdatingLocation()
        }*/
    }
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        
        if let mapView = self.mapView {
            let region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, self.distanceSpan, self.distanceSpan)
            mapView.setRegion(region, animated: true)
            mapView.showsUserLocation = true
        }
    }
    override func viewDidLayoutSubviews() {
        //Xét lại chiều cao khi xoay màn hình
        lbtitle.frame = CGRect(x: 0, y: 44, width: self.view.bounds.width, height: heightUI)
        btnRegister.frame = CGRect(x: 0, y: lbtitle.frame.origin.y + heightUI, width: self.view.bounds.width, height: heightUI)
        mapView.frame = CGRect(x: 0, y: btnRegister.frame.origin.y + heightUI, width: self.view.bounds.width, height: self.view.bounds.height-btnRegister.frame.origin.y)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

