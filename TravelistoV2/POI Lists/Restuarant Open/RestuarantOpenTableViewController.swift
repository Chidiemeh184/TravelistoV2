//
//  RestuarantOpenTableViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/23/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class RestuarantOpenTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: PlaceDescriptionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PlaceDescriptionTableViewCell.identifier)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: Row Height

extension RestuarantOpenTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let restuarantDetailTableViewCellHeight     = CGFloat(372)
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
            return tableViewCell
        case 1:
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: RestuarantMapTableViewCell.identifier) as!
            RestuarantMapTableViewCell
            return tableViewCell
        case 2:
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: RestuarantScheduleTableViewCell.identifier) as!
            RestuarantScheduleTableViewCell
            return tableViewCell
        case 3:
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: RestuarantAddressTableViewCell.identifier) as!
            RestuarantAddressTableViewCell
            return tableViewCell
        case 4:
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

extension RestuarantOpenTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if segue.identifier == Segue.showMoreToExploreOpen {
        //            //Send stuffs
        //        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // self.performSegue(withIdentifier: Segue.showMoreToExploreOpen, sender: (tableView, indexPath))
    }
}
