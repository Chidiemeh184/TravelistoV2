//
//  RestuarantOpenTableViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/23/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class RestuarantOpenTableViewController: UITableViewController {

    var place : TravelistoPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: PlaceDescriptionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PlaceDescriptionTableViewCell.identifier)
        self.navigationItem.title = place?.detail.name
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: Row Height

extension RestuarantOpenTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let restuarantDetailTableViewCellHeight     = CGFloat(376)
        let restuarantMapTableViewCellHeight        = CGFloat(127)
        let restuarantScheduleTableViewCellHeight   = CGFloat(81)
        let restuarantAddressTableViewCellHeight    = CGFloat(75)
        let restuarantplaceDescriptionCellHeight    = UITableViewAutomaticDimension
        
        switch indexPath.row {
        case 0:
            return restuarantDetailTableViewCellHeight
        case 1:
            return restuarantMapTableViewCellHeight
        case 2:
            return restuarantScheduleTableViewCellHeight
        case 3:
            return restuarantAddressTableViewCellHeight
        case 4:
            return restuarantplaceDescriptionCellHeight
        default:
            return CGFloat(200)
        }
    }
}

//MARK: Tableview Data Source

extension RestuarantOpenTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfTableCellRows = 5
        return numberOfTableCellRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: RestuarantDetailTableViewCell.identifier) as!
            RestuarantDetailTableViewCell
            if let restuarant = self.place {
                tableViewCell.setUp(withModel: restuarant)
            }
            return tableViewCell
        case 1:
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: RestuarantMapTableViewCell.identifier) as!
            RestuarantMapTableViewCell
            if let restuarantLocation = self.place?.detail.location {
                tableViewCell.setUp(withModel: restuarantLocation)
            }
            return tableViewCell
        case 2:
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: RestuarantScheduleTableViewCell.identifier) as!
            RestuarantScheduleTableViewCell
            return tableViewCell
        case 3:
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: RestuarantAddressTableViewCell.identifier) as!
            RestuarantAddressTableViewCell
            if let address = self.place?.detail.address {
                tableViewCell.setUp(withModel: address)
            }
            return tableViewCell
        case 4:
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: PlaceDescriptionTableViewCell.identifier) as!
            PlaceDescriptionTableViewCell
            tableViewCell.descriptionMoreButton.isHidden = true
            if let wikidescription = self.place?.wikipedia {
                tableViewCell.setUp(withModel: wikidescription)
            }
            return tableViewCell
        default:
            return UITableViewCell()
        }
    }
}
