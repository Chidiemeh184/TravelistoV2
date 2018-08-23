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
    
    var tableViewCellType: PlaceOfInterestCellType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNav()
        tableview.register(UINib(nibName: PlacesOfInterestListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier:  PlacesOfInterestListTableViewCell.identifier)
        tableview.register(UINib(nibName: PlacesOfInterestListTwoTableViewCell.identifier, bundle: nil), forCellReuseIdentifier:  PlacesOfInterestListTwoTableViewCell.identifier)
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.showNav()
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
        
        if segue.identifier == Segue.showMoreToExploreOpen {
            //Send stuffs
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.performSegue(withIdentifier: Segue.showMoreToExploreOpen, sender: (tableView, indexPath))
    }
}

enum PlaceOfInterestCellType: Int {
    case placeOfInterest = 1
    case restuarant = 2
}
