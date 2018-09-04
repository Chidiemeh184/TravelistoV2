//
//  ExploreTableViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/11/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import RevealingSplashView
import ChameleonFramework

class ExploreTableViewController: UITableViewController {

    //Refresh Control
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .darkGray
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }()
    
    let exploreImages = [#imageLiteral(resourceName: "travel-1"), #imageLiteral(resourceName: "travel-5"), #imageLiteral(resourceName: "travel-4"), #imageLiteral(resourceName: "travel-7"), #imageLiteral(resourceName: "travel-11"), #imageLiteral(resourceName: "travel-2"), #imageLiteral(resourceName: "travel-14"), #imageLiteral(resourceName: "travel-3"), #imageLiteral(resourceName: "travel-9"), #imageLiteral(resourceName: "travel-13"), #imageLiteral(resourceName: "travel-6"), #imageLiteral(resourceName: "travel-8"), #imageLiteral(resourceName: "travel-10"), #imageLiteral(resourceName: "travel-1") ]
    
    var data    : [ExploreBaseModel]?
    var data2   : [ExploreBaseModel]?
    var data3   : [ExploreBaseModel]?
    
    var datasource : [[ExploreBaseModel]?]?
    
    let sectionHeaderTitles = ["", "Curious","Relaxing"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        datasource = [data, data2, data3]
    }
    
    @objc
    private func requestData(){
        refreshControl?.beginRefreshing()
        print("Refreshing ExploreTableViewController ....")
        refreshControl?.endRefreshing()
    }
    
}

// MARK: - View Life cycle

extension ExploreTableViewController {
    
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

extension ExploreTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tripToCellHeight = CGFloat(250)
        let relaxationCellHeight = CGFloat(233)
        switch indexPath.row {
        case 0:
            return tripToCellHeight
        default:
            return relaxationCellHeight
        }
    }
}

//MARK: Tableview Data Source

extension ExploreTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfTableCellRows = datasource?.count
        return numberOfTableCellRows!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell()
        switch indexPath.row {
        case 0:
            let tripToTableViewCell = tableView.dequeueReusableCell(withIdentifier: TripToTableViewCell.identifier) as!
            TripToTableViewCell
            tripToTableViewCell.tripToCollectionView.tag = indexPath.row
            return tripToTableViewCell
        case 1:
            let relaxationTableViewCell = tableView.dequeueReusableCell(withIdentifier: RelaxationTableViewCell.identifier) as!
            RelaxationTableViewCell
            relaxationTableViewCell.typeIdentityNumber = indexPath.row
            relaxationTableViewCell.relaxationCollectionView.tag = indexPath.row
            relaxationTableViewCell.places = self.datasource?[indexPath.row]
            relaxationTableViewCell.showMoreButton.addTarget(self, action: #selector(ExploreTableViewController.showMoreButtonTapped), for: .touchUpInside)
            relaxationTableViewCell.showMoreButton.tag = indexPath.row
            relaxationTableViewCell.relaxationHeaderTitleLabel.text = self.sectionHeaderTitles[indexPath.row]
            return relaxationTableViewCell
        case 2:
            let relaxationTableViewCell = tableView.dequeueReusableCell(withIdentifier: RelaxationTableViewCell.identifier) as!
            RelaxationTableViewCell
            relaxationTableViewCell.typeIdentityNumber = indexPath.row
            relaxationTableViewCell.relaxationCollectionView.tag = indexPath.row
            relaxationTableViewCell.places = self.datasource?[indexPath.row]
            relaxationTableViewCell.showMoreButton.addTarget(self, action: #selector(ExploreTableViewController.showMoreButtonTapped), for: .touchUpInside)
            relaxationTableViewCell.showMoreButton.tag = indexPath.row
            relaxationTableViewCell.relaxationHeaderTitleLabel.text = self.sectionHeaderTitles[indexPath.row]
            return relaxationTableViewCell
        default:
            break
        }
        return tableViewCell
    }
}

//MARK: Tableview will display

extension ExploreTableViewController {
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            guard let cell = cell as? TripToTableViewCell else { return }
            let tripToCollectionView = cell.tripToCollectionView
            tripToCollectionView?.delegate = self
            tripToCollectionView?.dataSource = self
        }else {
            guard let cell = cell as? RelaxationTableViewCell else { return }
            let relaxationCollectionView = cell.relaxationCollectionView
            relaxationCollectionView?.delegate = self
            relaxationCollectionView?.dataSource = self
        }
    }
}

//MARK: - Collectionview Datasource & Delegate

extension ExploreTableViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItems = 0
        let tag = collectionView.tag
        switch tag {
        case 0:
            numberOfItems = (self.datasource![tag]?.count)!
        case 1:
            numberOfItems = (self.datasource![tag]?.count)!
        case 2:
            numberOfItems = (self.datasource![tag]?.count)!
        default:
            break
        }
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let defaultCell = UICollectionViewCell()
        let tag = collectionView.tag
        switch tag {
        case 0:
            let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: TripToCollectionViewCell.identifier, for: indexPath) as! TripToCollectionViewCell
            if let model = self.datasource![tag] {
                collectionViewCell.setUp(withModel: model[indexPath.row])
            }
            return collectionViewCell
        case 1:
            let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: RelaxationCollectionViewCell.identifier, for: indexPath) as! RelaxationCollectionViewCell
            if let model = self.datasource![tag] {
                collectionViewCell.setUp(withModel: model[indexPath.row])
            }
            return collectionViewCell
        case 2:
            let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: RelaxationCollectionViewCell.identifier, for: indexPath) as! RelaxationCollectionViewCell
            if let model = self.datasource![tag] {
                collectionViewCell.setUp(withModel: model[indexPath.row])
            }
            return collectionViewCell
        default:
            break
        }
        
        return defaultCell
    }
}

//MARK: CollectionView FlowLayout

extension ExploreTableViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let tripToCellLineSpacing = CGFloat(30)
        let relaxationCellLineSpacing = CGFloat(15)
        let tag = collectionView.tag == 0 ? tripToCellLineSpacing : relaxationCellLineSpacing
        return tag
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tag = collectionView.tag
        switch tag {
        case 0:
            let cellDefaultHeight = CGFloat(200)
            let cellDefaultWidth = CGFloat(335)
            let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
            return size
        default:
            let cellDefaultHeight = CGFloat(168)
            let cellDefaultWidth = CGFloat(135)
            let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
            return size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let tag = collectionView.tag
        switch tag {
        case 0:
            let inset = UIEdgeInsetsMake(0, 20, 0, 20)
            return inset
        default:
            let inset = UIEdgeInsetsMake(0, 20, 0, 20)
            return inset
        }
    }
}

// MARK: - Navigation & Segue

extension ExploreTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.exploreToExploreOpen {
            guard let info = sender as? (ExploreBaseModel, IndexPath) else { return }
            let place = info.0
            let exploreOpenTableViewController = segue.destination as! ExploreOpenTableViewController
            exploreOpenTableViewController.place = place
        }else if segue.identifier == Segue.exploreToShowMore {
            let buttonTagIndexPathRow = sender as! Int
            let placesToSend = self.datasource![buttonTagIndexPathRow]
            
            let showMoreTableViewController = segue.destination as!ShowMoreTableViewController
            showMoreTableViewController.places = placesToSend
            showMoreTableViewController.navigationItem.title = self.sectionHeaderTitles[buttonTagIndexPathRow]
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // self.performSegue(withIdentifier: Segue.exploreToExploreOpen, sender: (tableView, indexPath))
    }
}


extension ExploreTableViewController {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //GET Item from datasource before sending
        var place : ExploreBaseModel?
        let tag = collectionView.tag
        switch tag {
        case 0:
            place =  (collectionView.cellForItem(at: indexPath) as? TripToCollectionViewCell)?.place
        default:
            place = (collectionView.cellForItem(at: indexPath) as? RelaxationCollectionViewCell)?.place
        }
        self.performSegue(withIdentifier: Segue.exploreToExploreOpen, sender: (place, indexPath))
    }
}


// MARK: - Show More Open

extension ExploreTableViewController {
    @objc func showMoreButtonTapped(sender: UIButton){
        self.performSegue(withIdentifier: Segue.exploreToShowMore, sender: sender.tag)
    }
}



enum CollectionViewTag : Int {
    case isTripToCollectionViewTag = 1
    case isRelaxationCollectionViewTag = 2
}



//MARK: - Load Data
extension ExploreTableViewController {
    func loadData(){
        
        //Load Currency before sending
        let testPath = Bundle.main.path(forResource: "amass", ofType: "json")
        let testUrl = URL(fileURLWithPath: testPath!)
        
        do {
            let testJSONCodes = try Data(contentsOf: testUrl)
            let testCodes = try JSONDecoder().decode([ExploreBaseModel].self, from: testJSONCodes)
            self.data = testCodes
        }catch let error as NSError {
            print("Error Loading Explore base model : \(error)")
        }
        
        //Load Currency before sending
        let testPath2 = Bundle.main.path(forResource: "amass2", ofType: "json")
        let testUrl2 = URL(fileURLWithPath: testPath2!)
        
        do {
            let testJSONCodes2 = try Data(contentsOf: testUrl2)
            let testCodes2 = try JSONDecoder().decode([ExploreBaseModel].self, from: testJSONCodes2)
            self.data2 = testCodes2
        }catch let error as NSError {
            print("Error Loading Explore base model 2 : \(error)")
        }
        
        //Load Currency before sending
        let testPath3 = Bundle.main.path(forResource: "amass3", ofType: "json")
        let testUrl3 = URL(fileURLWithPath: testPath3!)
        
        do {
            let testJSONCodes3 = try Data(contentsOf: testUrl3)
            let testCodes3 = try JSONDecoder().decode([ExploreBaseModel].self, from: testJSONCodes3)
            self.data3 = testCodes3
        }catch let error as NSError {
            print("Error Loading Explore base model 3 : \(error)")
        }
        
        
    }
    
}




