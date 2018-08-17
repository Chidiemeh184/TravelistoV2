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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.hideNav()
    }
    
    @objc
    private func requestData(){
        refreshControl?.beginRefreshing()
        print("Refreshing ExploreTableViewController ....")
        refreshControl?.endRefreshing()
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
        let numberOfTableCellRows = 3
        return numberOfTableCellRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tableViewCell = UITableViewCell()
        switch indexPath.row {
        case 0:
            tableViewCell = tableView.dequeueReusableCell(withIdentifier: TripToTableViewCell.identifier) as!
            TripToTableViewCell
        default:
            tableViewCell = tableView.dequeueReusableCell(withIdentifier: RelaxationTableViewCell.identifier) as!
            RelaxationTableViewCell
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
        return collectionView.tag == 1 ? self.exploreImages.count : self.exploreImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tag = CollectionViewTag(rawValue: collectionView.tag)!
        switch tag {
        case .isTripToCollectionViewTag:
            let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: TripToCollectionViewCell.identifier, for: indexPath) as! TripToCollectionViewCell
            collectionViewCell.placeImageView.image = exploreImages[indexPath.row]
            let imageGCColor = UIColor(averageColorFrom: exploreImages[indexPath.row]).cgColor
            collectionViewCell.applyShadowBlurEffect(withColor: imageGCColor, cornerRadius: 8.0, shadowRadius: 5.0)

            return collectionViewCell
        case .isRelaxationCollectionViewTag:
            let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: RelaxationCollectionViewCell.identifier, for: indexPath) as! RelaxationCollectionViewCell
            collectionViewCell.placeImageView.image = exploreImages[indexPath.row]
            let imageGCColor = UIColor(averageColorFrom: exploreImages[indexPath.row]).cgColor
            collectionViewCell.applyShadowBlurEffect(withColor: imageGCColor, cornerRadius: 4.0, shadowRadius: 2.0)
            
            return collectionViewCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Perform Segue
    }
}

//MARK: CollectionView FlowLayout

extension ExploreTableViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let tripToCellLineSpacing = CGFloat(30)
        let relaxationCellLineSpacing = CGFloat(15)
        let tag = CollectionViewTag(rawValue: collectionView.tag)! == .isTripToCollectionViewTag ? tripToCellLineSpacing : relaxationCellLineSpacing
        return tag
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tag = CollectionViewTag(rawValue: collectionView.tag)!
        switch tag {
        case .isTripToCollectionViewTag:
            let cellDefaultHeight = CGFloat(200)
            let cellDefaultWidth = CGFloat(335)
            let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
            return size
        case .isRelaxationCollectionViewTag:
            let cellDefaultHeight = CGFloat(168)
            let cellDefaultWidth = CGFloat(135)
            let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
            return size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let tag = CollectionViewTag(rawValue: collectionView.tag)!
        switch tag {
        case .isTripToCollectionViewTag:
            let inset = UIEdgeInsetsMake(0, 16, 0, 16)
            return inset
        case .isRelaxationCollectionViewTag:
            let inset = UIEdgeInsetsMake(0, 16, 0, 16)
            return inset
        }
    }
}

enum CollectionViewTag : Int {
    case isTripToCollectionViewTag = 1
    case isRelaxationCollectionViewTag = 2
}



