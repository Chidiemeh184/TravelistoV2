//
//  POIOpenTableViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/23/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class POIOpenTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: PlaceDescriptionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PlaceDescriptionTableViewCell.identifier)
    }

    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: Row Height

extension POIOpenTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let pOIDetailTableViewCellHeight        = CGFloat(573)
        let pOIRatingReviewTableViewCellHeight  = CGFloat(87)
        let placeDescriptionCellHeight          = UITableViewAutomaticDimension
        
        switch indexPath.row {
        case 0:
            return pOIDetailTableViewCellHeight
        case 1:
            return pOIRatingReviewTableViewCellHeight
        case 2:
            return placeDescriptionCellHeight
        default:
            return CGFloat(200)
        }
    }
}

//MARK: Tableview Data Source

extension POIOpenTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfTableCellRows = 3
        return numberOfTableCellRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: POIDetailTableViewCell.identifier) as!
            POIDetailTableViewCell
            return tableViewCell
        case 1:
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: POIRatingReviewTableViewCell.identifier) as!
            POIRatingReviewTableViewCell
            return tableViewCell
        case 2:
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: PlaceDescriptionTableViewCell.identifier) as!
            PlaceDescriptionTableViewCell
            tableViewCell.descriptionMoreButton.isHidden = true
            return tableViewCell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - Navigation & Segue

extension POIOpenTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == Segue.showMoreToExploreOpen {
//            //Send stuffs
//        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // self.performSegue(withIdentifier: Segue.showMoreToExploreOpen, sender: (tableView, indexPath))
    }
}

