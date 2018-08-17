//
//  ExploreOpenViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/16/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class ExploreOpenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var exploreOpenTableView: UITableView!
    
    let exploreImages = [ #imageLiteral(resourceName: "travel-9"), #imageLiteral(resourceName: "travel-13"), #imageLiteral(resourceName: "travel-6"), #imageLiteral(resourceName: "travel-8"), #imageLiteral(resourceName: "travel-10"), #imageLiteral(resourceName: "travel-1") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.hideNav()
        exploreOpenTableView.delegate = self
        exploreOpenTableView.dataSource = self
        let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
        statusBar?.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        UIApplication.shared.statusBarStyle = .lightContent
        
        exploreOpenTableView.rowHeight = UITableViewAutomaticDimension
        let defaultTableViewHeight = CGFloat(1367)
        exploreOpenTableView.estimatedRowHeight = defaultTableViewHeight
    }
    
    override func viewDidLayoutSubviews() {
        if let rect = self.navigationController?.navigationBar.frame {
            let y = rect.size.height + rect.origin.y
            self.exploreOpenTableView.contentInset = UIEdgeInsetsMake( -y, 0, 0, 0)
            self.exploreOpenTableView.scrollIndicatorInsets = UIEdgeInsetsMake(-y, 0, 0, 0)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: Row Height

extension ExploreOpenViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let defaultHeight = CGFloat(1368)
        return defaultHeight
    }
}

//MARK: Tableview Data Source

extension ExploreOpenViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfTableCellRows = 1
        return numberOfTableCellRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tableViewCell = UITableViewCell()
        tableViewCell = tableView.dequeueReusableCell(withIdentifier: ExploreOpenTableViewCell.identifier) as!
        ExploreOpenTableViewCell
        return tableViewCell
    }
}

//MARK: Tableview will display

extension ExploreOpenViewController {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ExploreOpenTableViewCell else { return }
        let exploreOpenCollectionView = cell.exploreOpenCollectionView
        exploreOpenCollectionView?.delegate = self
        exploreOpenCollectionView?.dataSource = self
    }
}

//MARK: - Collectionview Datasource & Delegate

extension ExploreOpenViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.exploreImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreOpenCollectionViewCell.identifier, for: indexPath) as! ExploreOpenCollectionViewCell
        collectionViewCell.placeImageView.image = exploreImages[indexPath.row]
        let imageGCColor = UIColor(averageColorFrom: exploreImages[indexPath.row]).cgColor
        collectionViewCell.applyShadowBlurEffect(withColor: imageGCColor, cornerRadius: 4.0, shadowRadius: 2.0)
        
        return collectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Perform Segue
    }
}

//MARK: CollectionView FlowLayout

extension ExploreOpenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let cellLineSpacing = CGFloat(15)
        return cellLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellDefaultHeight = CGFloat(160)
        let cellDefaultWidth = CGFloat(120)
        let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsetsMake(0, 16, 0, 16)
        return inset
    }
}
