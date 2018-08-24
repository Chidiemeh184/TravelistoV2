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
        let cellHeight = self.tableViewCellType == .placeOfInterest ? CGFloat(87) : CGFloat(138)
        return cellHeight
    }
}

//MARK: Tableview Data Source

extension PlacesOfInterestListViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfTableCellRows = 9
        return numberOfTableCellRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var defaultCell = UITableViewCell()
        if let cellType = self.tableViewCellType {
            switch cellType {
            case .placeOfInterest:
                defaultCell = tableView.dequeueReusableCell(withIdentifier: PlacesOfInterestListTableViewCell.identifier) as!
                PlacesOfInterestListTableViewCell
                defaultCell.contentView.frame = CGRect(x: 0, y: 0, width: 375, height: 87)
            case .restuarant:
                defaultCell = tableView.dequeueReusableCell(withIdentifier: PlacesOfInterestListTwoTableViewCell.identifier) as!
                PlacesOfInterestListTwoTableViewCell
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
        }else if segue.identifier == Segue.restuarantsListToRestuarantOpen {
            //Send restuarant
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = tableView.cellForRow(at: indexPath)
        
        switch cellType {
        case is PlacesOfInterestListTableViewCell :
            self.performSegue(withIdentifier: Segue.placeOfInterestToPOIOpen, sender: (tableView, indexPath))
        default:
            self.performSegue(withIdentifier: Segue.restuarantsListToRestuarantOpen, sender: (tableView, indexPath))
        }
    }
}

enum PlaceOfInterestCellType: Int {
    case placeOfInterest = 1
    case restuarant = 2
}
