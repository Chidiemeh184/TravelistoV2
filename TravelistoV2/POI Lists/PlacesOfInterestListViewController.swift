//
//  PlacesOfInterestListViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/20/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class PlacesOfInterestListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var navItem: UINavigationItem!
    var tableViewCellType: PlaceOfInterestCellType!
    
    var navTitle  = ""
    
    var places : [TravelistoPlace]?
    var restuarants : [TravelistoPlace]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNav()
        self.navItem.title = navTitle
        tableview.register(UINib(nibName: PlacesOfInterestListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier:  PlacesOfInterestListTableViewCell.identifier)
        tableview.register(UINib(nibName: PlacesOfInterestListTwoTableViewCell.identifier, bundle: nil), forCellReuseIdentifier:  PlacesOfInterestListTwoTableViewCell.identifier)
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.hideNav()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.showNav()
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
    
    }
    
}


//MARK: Row Height

extension PlacesOfInterestListViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = self.tableViewCellType == .placeOfInterest ? CGFloat(90) : CGFloat(138)
        return cellHeight
    }
}

//MARK: Tableview Data Source

extension PlacesOfInterestListViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfTableCellRows = (self.tableViewCellType == .placeOfInterest) ? self.places?.count : self.restuarants?.count
        return numberOfTableCellRows!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let defaultCell = UITableViewCell()
        if let cellType = self.tableViewCellType {
            switch cellType {
            case .placeOfInterest:
                let cell = tableView.dequeueReusableCell(withIdentifier: PlacesOfInterestListTableViewCell.identifier) as!
                PlacesOfInterestListTableViewCell
                cell.contentView.frame = CGRect(x: 0, y: 0, width: 375, height: 90)
                if let poi = self.places {
                    cell.setUp(withModel: poi[indexPath.row])
                }
                return cell
            case .restuarant:
                let cell = tableView.dequeueReusableCell(withIdentifier: PlacesOfInterestListTwoTableViewCell.identifier) as!
                PlacesOfInterestListTwoTableViewCell
                if let resturants = self.restuarants {
                    cell.setUp(withModel: resturants[indexPath.row])
                }
                return cell
            }
        }
        
        return defaultCell
    }
}

// MARK: - Navigation & Segue

extension PlacesOfInterestListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.placeOfInterestToPOIOpen {
            //Send stuffs
            guard let info = sender as? (TravelistoPlace, IndexPath) else { return }
            let place = info.0
            let nav = segue.destination as! UINavigationController
            let POIOpenTableViewController = nav.viewControllers.first as! POIOpenTableViewController
            POIOpenTableViewController.place = place
        }else if segue.identifier == Segue.restuarantsListToRestuarantOpen {
            //Send restuarant
            guard let info = sender as? (TravelistoPlace, IndexPath) else { return }
            let place = info.0
            let nav = segue.destination as! UINavigationController
            let restuarantOpenTableViewController = nav.viewControllers.first as! RestuarantOpenTableViewController
            restuarantOpenTableViewController.place = place
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = tableView.cellForRow(at: indexPath)
        
        switch cellType {
        case is PlacesOfInterestListTableViewCell :
            let cell = tableView.cellForRow(at: indexPath) as! PlacesOfInterestListTableViewCell
            self.performSegue(withIdentifier: Segue.placeOfInterestToPOIOpen, sender: (cell.place, indexPath))
        default:
            let cell = tableView.cellForRow(at: indexPath) as! PlacesOfInterestListTwoTableViewCell
            self.performSegue(withIdentifier: Segue.restuarantsListToRestuarantOpen, sender: (cell.place, indexPath))
        }
    }
}

enum PlaceOfInterestCellType: Int {
    case placeOfInterest = 1
    case restuarant = 2
}
