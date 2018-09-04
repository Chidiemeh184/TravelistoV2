//
//  ShowMoreTableViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class ShowMoreTableViewController: UITableViewController {

    var places : [ExploreBaseModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName:  ShowMoreTableViewCell.identifier, bundle: nil), forCellReuseIdentifier:  ShowMoreTableViewCell.identifier)
        self.enableLeftSwipe()
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.makeNavBarInvisible()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        self.navigationController?.view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }

}


//MARK: Row Height

extension ShowMoreTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let defaultHeight = CGFloat(75)
        return defaultHeight
    }
}

//MARK: Tableview Data Source

extension ShowMoreTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfTableCellRows = self.places?.count else { return 0 }
        return numberOfTableCellRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: ShowMoreTableViewCell.identifier) as!
        ShowMoreTableViewCell

        if let model = self.places {
            tableViewCell.setUp(withModel: model[indexPath.row])
        }
        return tableViewCell
    }
}

// MARK: - Navigation & Segue

extension ShowMoreTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.showMoreToExploreOpen {
            let placeToSend = sender as? ExploreBaseModel
            let exploreOpenTableViewController = segue.destination as! ExploreOpenTableViewController
            exploreOpenTableViewController.place = placeToSend
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tableCell = tableView.cellForRow(at: indexPath) as? ShowMoreTableViewCell
        let place = tableCell?.place
        self.performSegue(withIdentifier: Segue.showMoreToExploreOpen, sender: place)
    }
}


