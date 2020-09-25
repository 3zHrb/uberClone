//
//  HomeScreen.swift
//  UberCloneAziz
//
//  Created by Abdulaziz Alharbi on 12/09/2020.
//

import Foundation
import UIKit
import MapKit

class HomeScreen: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Favorit" : "Suggestions"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var mycell = CustomCell()
                
        return mycell
    }
    
    
    var mapView: MKMapView!
    var searchTextField: PlacesScearchTextField!
    var sourceAndDestinationView: SourceAndDestinationView!
    var placesTableView: UITableView!
    var cheatingBarView: UIView!
    
    override func viewDidLoad() {
        
        mapView = MKMapView()
        mapView.frame = self.view.frame
        
        searchTextField = PlacesScearchTextField(delegateVC: self)
        sourceAndDestinationView = SourceAndDestinationView(delegateVC: self)
        sourceAndDestinationView.layer.opacity = 0
        sourceAndDestinationView.layer.zPosition = 1
        
        placesTableView = UITableView()
        placesTableView.delegate = self
        placesTableView.dataSource = self
//        placesTableView.frame.size = CGSize(width: 0, height: 0)
        placesTableView.tableFooterView = UIView()
//        placesTableView.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height - )
        
        
        
//        sourceAndDestinationView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.25)
//        sourceAndDestinationView.backgroundColor = .white
        
        cheatingBarView = UIView()
        
        
        self.view.addSubview(mapView)
        self.view.addSubview(searchTextField)
        self.view.addSubview(sourceAndDestinationView)
        self.view.addSubview(placesTableView)

//        sourceAndDestinationView.anchors(top: view.safeAreaLayoutGuide.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor)
//        sourceAndDestinationView.dimentions(width: self.view.frame.width, height: self.view.frame.height * 0.17)
        
        
        searchTextField.createScreachViewWithSpecifications()
        sourceAndDestinationView.setUpSourceAndDestinationView()
        
//        self.placesTableView.anchors(top: self.sourceAndDestinationView.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0)
        placesTableView.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height - self.sourceAndDestinationView.frame.height)
       
        
        
    }
    
}

extension HomeScreen: GestureDelegate{

    func userDidTouchTheSearchbar() {
    
        UIView.animate(withDuration: 0.3) {
            self.searchTextField.alpha = 0
            self.sourceAndDestinationView.alpha = 1
            self.sourceAndDestinationView.frame = CGRect(x: 0, y: self.view.safeAreaLayoutGuide.layoutFrame.minY, width: self.view.frame.width, height: self.view.frame.height * 0.17)
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.placesTableView.frame = CGRect(x: 0, y: self.sourceAndDestinationView.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - self.sourceAndDestinationView.frame.height)
            }
        }

    }
}

extension HomeScreen: BackButtonDelegate{
    
    
    func backButtonFromSourceAndDestinationViewIsPressed() {
        UIView.animate(withDuration: 0.3) {
        self.placesTableView.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height - self.sourceAndDestinationView.frame.height)
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
//
                self.sourceAndDestinationView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height * 0.17)
                self.sourceAndDestinationView.alpha = 0
                self.searchTextField.alpha = 1
                
            }
        }
    }
    
    
}
