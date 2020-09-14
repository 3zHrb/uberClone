//
//  HomeScreen.swift
//  UberCloneAziz
//
//  Created by Abdulaziz Alharbi on 12/09/2020.
//

import Foundation
import UIKit
import MapKit

class HomeScreen: UIViewController{
    
    var mapView: MKMapView!
    var searchTextField: PlacesScearchTextField!
    var sourceAndDestinationView: SourceAndDestinationView!
    
    override func viewDidLoad() {
        
        mapView = MKMapView()
        mapView.frame = self.view.frame
        
        searchTextField = PlacesScearchTextField(delegateVC: self)
        sourceAndDestinationView = SourceAndDestinationView(delegateVC: self)
        sourceAndDestinationView.layer.opacity = 0
        
        self.view.addSubview(mapView)
        self.view.addSubview(searchTextField)
        self.view.addSubview(sourceAndDestinationView)
        
        searchTextField.createScreachViewWithSpecifications()
        sourceAndDestinationView.setUpSourceAndDestinationView()
        
    }
    
}

extension HomeScreen: GestureDelegate{
    
    
    func userDidTouchTheSearchbar() {
        self.searchTextField.layer.opacity = 0
        self.sourceAndDestinationView.layer.opacity = 1
    }
    
    
    
    
}
