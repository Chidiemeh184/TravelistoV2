//
//  POIOpenTableViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/23/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import SVProgressHUD

class POIOpenTableViewController: UITableViewController {

    var place : TravelistoPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: PlaceDescriptionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PlaceDescriptionTableViewCell.identifier)
        self.navigationItem.title = place?.detail.name
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
            if let poi = self.place {
                tableViewCell.setUp(withModel: poi)
            }
            let slideShowButton = tableViewCell.viewPhotosButton
            slideShowButton?.addTarget(self, action: #selector(POIOpenTableViewController.slideShowModalButtonTapped), for: .touchUpInside)
            return tableViewCell
        case 1:
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: POIRatingReviewTableViewCell.identifier) as!
            POIRatingReviewTableViewCell
            if let detail = self.place?.detail {
                tableViewCell.setUp(withModel: detail)
            }
            return tableViewCell
        case 2:
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: PlaceDescriptionTableViewCell.identifier) as!
            PlaceDescriptionTableViewCell
            tableViewCell.descriptionMoreButton.isHidden = true
            if let poiDescription = place?.wikipedia {
                tableViewCell.setUp(withModel: poiDescription)
            }
            return tableViewCell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - Show More Open

extension POIOpenTableViewController {
    
    @objc func slideShowModalButtonTapped(){
        if let images = self.place?.images, images.count > 0 {
            let storyboard = UIStoryboard(name: Storyboard.SlideShow, bundle: nil)
            let slideShowViewController = storyboard.instantiateViewController(withIdentifier: Storyboard.SlideShowSB) as! SlideShowViewController
            slideShowViewController.navTitle = self.place?.detail.name ?? ""
            slideShowViewController.pixabayImages = images
            self.present(slideShowViewController, animated: true, completion: nil)
        }else {
            CustomProgressHud.blackTheme()
            SVProgressHUD.showError(withStatus: TravelistoMessages.imagesUnavailable)
        }
    }
}

