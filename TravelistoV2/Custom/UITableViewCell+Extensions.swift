//
//  UITableViewCell+Extensions.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 9/4/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func getStarImageRatings(rating: Double) -> [UIImage] {
        
        var stars: [UIImage] = []
        var ratingPercent : Float = 0.0
        var finalRating : Int = 0

        if rating < 0 {
            ratingPercent = Float(rating * 100)
            finalRating = Int(ratingPercent - ratingPercent.truncatingRemainder(dividingBy: 1))
        }else if rating > 10 && rating < 20 {
            ratingPercent = Float(rating/4.2)
            finalRating = Int(ratingPercent - ratingPercent.truncatingRemainder(dividingBy: 1))
        }

        switch finalRating {
        case 1:
            stars = [ #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-gray"), #imageLiteral(resourceName: "star-gray"), #imageLiteral(resourceName: "star-gray"), #imageLiteral(resourceName: "star-gray") ]
        case 2:
            stars = [ #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-gray"), #imageLiteral(resourceName: "star-gray"), #imageLiteral(resourceName: "star-gray") ]
        case 3:
            stars = [ #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-gray"), #imageLiteral(resourceName: "star-gray") ]
        case 4:
            stars = [ #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-gray") ]
        case 5...1000:
            stars = [ #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow") ]
        default:
            stars = [ #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow"), #imageLiteral(resourceName: "star-yellow") ]
        }
        
        return stars
    }
    
}

