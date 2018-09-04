//
//  TopExperiencesTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/18/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class TopExperiencesTableViewCell: UITableViewCell {

    static let identifier = "TopExperiencesTableViewCell"
    @IBOutlet weak var showMoreButtton: UIButton!
    
    @IBOutlet weak var placeOneImageView: UIImageView!
    @IBOutlet weak var placeOneLabel: UILabel!
    @IBOutlet weak var placeTwoImageView: UIImageView!
    @IBOutlet weak var placeTwoLabel: UILabel!
    @IBOutlet weak var placeThreeImageView: UIImageView!
    @IBOutlet weak var placeThreeLabel: UILabel!
    @IBOutlet weak var placeFourImageView: UIImageView!
    @IBOutlet weak var placeFourLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var pointsOfInterest : [TravelistoPlace]?

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUp(withModel pointsOfInterest: [TravelistoPlace]){
        self.pointsOfInterest = pointsOfInterest
        let places = pointsOfInterest.prefix(pointsOfInterest.count)
        
        //1
        let image = places[0].images.first
        let url = image?.largeImageURL
        placeOneImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "imagePlaceHolder"), options: [.continueInBackground], completed: nil)
        placeOneLabel.text = places[0].detail.name
        
        //2
        let image2 = places[1].images.first
        let url2 = image2?.largeImageURL
        placeTwoImageView.sd_setImage(with: url2, placeholderImage: #imageLiteral(resourceName: "imagePlaceHolder"), options: [.continueInBackground], completed: nil)
        placeTwoLabel.text = places[1].detail.name
        
        //3
        let image3 = places[2].images.first
        let url3 = image3?.largeImageURL
        placeThreeImageView.sd_setImage(with: url3, placeholderImage: #imageLiteral(resourceName: "imagePlaceHolder"), options: [.continueInBackground], completed: nil)
        placeThreeLabel.text = places[2].detail.name
        
        //4
        let image4 = places[3].images.first
        let url4 = image4?.largeImageURL
        placeFourImageView.sd_setImage(with: url4, placeholderImage: #imageLiteral(resourceName: "imagePlaceHolder"), options: [.continueInBackground], completed: nil)
        placeFourLabel.text = "\(pointsOfInterest.count - 3)+"
        
    }
}
