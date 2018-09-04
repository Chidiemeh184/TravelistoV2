//
//  PlaceMapTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/18/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class PlaceMapTableViewCell: UITableViewCell {
    
    static let identifier = "PlaceMapTableViewCell"

    @IBOutlet weak var placeMapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.placeMapView.layer.cornerRadius = 8
        self.placeMapView.layer.masksToBounds = true
    }
    
    func setUp(withModel location: SygicPlaceDetail.Location){
        let latitude = location.lat
        let longitude = location.lng
        let placeCoordinates = CLLocationCoordinate2D(latitude: latitude , longitude: longitude)
        let placeAnnotation = DestinationAnnotation(coordinate: placeCoordinates, title: "", subtitle: "")
        placeMapView.setRegion(placeAnnotation.region, animated: true)
    }
}


final class DestinationAnnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate : CLLocationCoordinate2D, title : String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
    }
    
    var region: MKCoordinateRegion {
        let span = MKCoordinateSpanMake(0.01, 0.01)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}
