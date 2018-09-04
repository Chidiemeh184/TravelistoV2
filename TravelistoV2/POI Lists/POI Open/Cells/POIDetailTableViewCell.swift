//
//  POIDetailTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/23/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import MapKit

class POIDetailTableViewCell: UITableViewCell {
    
    static let identifier = "POIDetailTableViewCell"
    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var viewPhotosButton: UIButton!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeAddressLabel: UILabel!
    
    @IBOutlet weak var placeMapview: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(withModel place: TravelistoPlace ){
        
        //1
        let image = place.images.first
        let url = image?.largeImageURL
        placeImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "imagePlaceHolder"), options: [.continueInBackground], completed: nil)
        placeNameLabel.text = place.detail.name
        let rating = place.detail.rating
        let localRating = (place.detail.ratingLocal * 100)
        ratingLabel.text = "\(String(describing: rating.round(rating, to: 3))) (\(String(describing: localRating.round(localRating, to: 1))) ratings)"
        placeAddressLabel.text = place.detail.address ?? ""
        
        let latitude = place.detail.location.lat
        let longitude = place.detail.location.lng
        let placeCoordinates = CLLocationCoordinate2D(latitude: latitude , longitude: longitude)
        let placeAnnotation = DestinationAnnotation(coordinate: placeCoordinates, title: place.detail.name, subtitle: "")
        placeMapview.setRegion(placeAnnotation.region, animated: true)
        
    }
    
    

}
