//
//  ExploreOpenTableViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/18/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class ExploreOpenTableViewController: UITableViewController {
    
    //Class properties
    var isCountryDescriptionMoreButtonTapped = false
    var isFoodDescriptionMoreButtonTapped  = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibs()
        
        let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
        statusBar?.backgroundColor = UIColor.clear
        self.makeNavBarInvisible()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func expandDescriptionButtonTapped(sender: UIButton){
        print("Button Tapped by: \(sender.tag)")
        let buttonTag = sender.tag
        switch buttonTag {
        case 0:
            self.isCountryDescriptionMoreButtonTapped = !isCountryDescriptionMoreButtonTapped ? true : false
            self.changeAndReloadButton(button: sender, forCondition: isCountryDescriptionMoreButtonTapped)
        case 1:
            self.isFoodDescriptionMoreButtonTapped = !isFoodDescriptionMoreButtonTapped ? true : false
            self.changeAndReloadButton(button: sender, forCondition: isFoodDescriptionMoreButtonTapped)
        default:
           break
        }
    }
    
    private func changeAndReloadButton(button: UIButton, forCondition: Bool){
        print("Button condition before tap: \(forCondition)")
        let changedTitle = forCondition ? "less" : "more"
        print("Button condition after tap: \(changedTitle)")
        button.setTitle(changedTitle, for: .normal)
        let rowIndexPath = button.tag == 0 ? 1 : 4
        let indexPath = IndexPath(item: rowIndexPath, section: 0)
        self.tableView.reloadRows(at: [indexPath], with: .none)
    }
}

// MARK: - View Life cycle

extension ExploreOpenTableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.makeNavBarInvisible()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
    }
    
    override func viewDidLayoutSubviews() {
        if let rect = self.navigationController?.navigationBar.frame {
            let y = rect.size.height + rect.origin.y
            self.tableView.contentInset = UIEdgeInsetsMake( -y, 0, 0, 0)
            self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(-y, 0, 0, 0)
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
            UIApplication.shared.statusBarStyle = .default
            navigationController?.navigationBar.tintColor = .black
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
            UIApplication.shared.statusBarStyle = .lightContent
            navigationController?.navigationBar.tintColor = .white
        }
    }
}

// MARK: - Register Nibs

extension ExploreOpenTableViewController {
    private func registerNibs(){
        tableView.register(UINib(nibName: TopImageHeaderTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TopImageHeaderTableViewCell.identifier)
        tableView.register(UINib(nibName: PlaceDescriptionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PlaceDescriptionTableViewCell.identifier)
        tableView.register(UINib(nibName: PlaceMapTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PlaceMapTableViewCell.identifier)
        tableView.register(UINib(nibName: TopExperiencesTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TopExperiencesTableViewCell.identifier)
        tableView.register(UINib(nibName: HorizontalPlaceListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HorizontalPlaceListTableViewCell.identifier)
        tableView.register(UINib(nibName: ConfirmationButtonTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ConfirmationButtonTableViewCell.identifier)
    }
}

// MARK: - TableView DATA SOURCE

extension ExploreOpenTableViewController  {
    
    // ROW HEIGHTS
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let topImageCellHeight              = CGFloat(220)
        let cityDescriptionCellHeight       = CGFloat(262)
        let cityMapCellHeight               = CGFloat(220)
        let topExperiencesCellHeight        = CGFloat(252)
        let foodDescriptionCellHeight       = CGFloat(173)
        let horizontalPlacesCellHeight      = CGFloat(246)
        let confirmationButtonCellHeight    = CGFloat(89)
        
        switch indexPath.row {
        case 0: return topImageCellHeight
        case 1: return isCountryDescriptionMoreButtonTapped ? UITableViewAutomaticDimension : cityDescriptionCellHeight
        case 2: return cityMapCellHeight
        case 3: return topExperiencesCellHeight
        case 4: return isFoodDescriptionMoreButtonTapped ? UITableViewAutomaticDimension : foodDescriptionCellHeight
        case 5: return horizontalPlacesCellHeight
        case 6: return confirmationButtonCellHeight
        default:
            return CGFloat(0)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        let sectionNumber = 1
        return sectionNumber
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowNumber = 7
        return rowNumber
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopImageHeaderTableViewCell.identifier, for: indexPath) as! TopImageHeaderTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PlaceDescriptionTableViewCell.identifier, for: indexPath) as! PlaceDescriptionTableViewCell
            cell.descriptionMoreButton.tag = 0
            let moreExpandingButton = cell.descriptionMoreButton
            moreExpandingButton?.addTarget(self, action: #selector(ExploreOpenTableViewController.expandDescriptionButtonTapped(sender:)), for: .touchUpInside)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: PlaceMapTableViewCell.identifier, for: indexPath) as! PlaceMapTableViewCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopExperiencesTableViewCell.identifier, for: indexPath) as! TopExperiencesTableViewCell
            cell.showMoreButtton.addTarget(self, action: #selector(ExploreOpenTableViewController.showMorePlacesOfInterestsButtonTapped), for: .touchUpInside)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: PlaceDescriptionTableViewCell.identifier, for: indexPath) as! PlaceDescriptionTableViewCell
            cell.descriptionMoreButton.tag = 1
            let moreExpandingButton = cell.descriptionMoreButton
            moreExpandingButton?.addTarget(self, action: #selector(ExploreOpenTableViewController.expandDescriptionButtonTapped(sender:)), for: .touchUpInside)
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: HorizontalPlaceListTableViewCell.identifier, for: indexPath) as! HorizontalPlaceListTableViewCell
            cell.horizontalPlaceShoeMoreButton.addTarget(self, action: #selector(ExploreOpenTableViewController.showMoreRestuarantsButtonTapped), for: .touchUpInside)
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: ConfirmationButtonTableViewCell.identifier, for: indexPath) as! ConfirmationButtonTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
}


// MARK: - Tableview Will Display Collectionview

extension ExploreOpenTableViewController {
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let horizontalPlacesCell = cell as? HorizontalPlaceListTableViewCell else  { return }
        let collectionView = horizontalPlacesCell.horizontalPlaceCollectionView
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(UINib(nibName: HorizontalPlaceListCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: HorizontalPlaceListCollectionViewCell.identifier)
    }
}

//MARK: - Collectionview Delegate & Datasource

extension ExploreOpenTableViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let collectionCellLineSpacing = CGFloat(15)
        return collectionCellLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellDefaultHeight = CGFloat(161)
        let cellDefaultWidth = CGFloat(135)
        let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsetsMake(10, 20, 10, 20)
        return inset
    }
}

//MARK: - Collectionview Datasource

extension ExploreOpenTableViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalPlaceListCollectionViewCell.identifier, for: indexPath) as! HorizontalPlaceListCollectionViewCell
        cell.applyCornerRadius(cornerRadius: 8)
        return cell
    }
    
}

// MARK: - Navigation & Segue

extension ExploreOpenTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.exploreOpenToPlacesOfInterest {
            if let placesOfInterestViewController = segue.destination as? PlacesOfInterestListViewController {
                placesOfInterestViewController.tableViewCellType = PlaceOfInterestCellType.placeOfInterest
            }
        }else if segue.identifier == Segue.exploreToShowMoreRestuarants {
            if let placesOfInterestViewController = segue.destination as? PlacesOfInterestListViewController {
                placesOfInterestViewController.tableViewCellType = PlaceOfInterestCellType.restuarant
            }
        }
    }
        
}

extension ExploreOpenTableViewController {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //GET Item from datasource before sending
        
//        let storyboard = UIStoryboard(name: "ExploreOpen", bundle: nil)
//        let slideShow = storyboard.instantiateViewController(withIdentifier: "SlideShowSB") as! SlideShowViewController
//        self.present(slideShow, animated: true, completion: nil)
        
//        let signInViewController = storyboard.instantiateViewController(withIdentifier: Storyboard.SignInViewController) as! SignInViewController
//        signInViewController.isSecondLaunched = true
//        window?.rootViewController = signInViewController
        
        self.performSegue(withIdentifier: Segue.exploreOpenToPlacesOfInterest, sender: (collectionView, indexPath))
    }
}


// MARK: - Show More Open

extension ExploreOpenTableViewController {
    
    @objc func showMorePlacesOfInterestsButtonTapped(){
        self.performSegue(withIdentifier: Segue.exploreOpenToPlacesOfInterest, sender: nil)
    }
    
    @objc func showMoreRestuarantsButtonTapped(){
        self.performSegue(withIdentifier: Segue.exploreToShowMoreRestuarants, sender: nil)
    }
}

