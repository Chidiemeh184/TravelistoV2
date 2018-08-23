//
//  SlideShowViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SlideShowViewController: UIViewController {

    @IBOutlet weak var slideShowPageControl: UIPageControl!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var visitsLabel: UILabel!
    @IBOutlet weak var placeDescriptionLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    private let images = [ #imageLiteral(resourceName: "travel-5"), #imageLiteral(resourceName: "travel-7"), #imageLiteral(resourceName: "travel-11"), #imageLiteral(resourceName: "travel-14")]
    private let messages = [TravelistoMessages.onboarding1,
                            TravelistoMessages.onboarding2,
                            TravelistoMessages.onboarding3,
                            TravelistoMessages.onboarding4]
    private var screenSize: CGRect!
    private var screenWidth: CGFloat!
    private var screenHeight: CGFloat!
    private var oneFourthWidth: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNav()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.screenSize = UIScreen.main.bounds
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
        slideShowPageControl.numberOfPages = images.count
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        self.makeNavBarInvisible()
        self.navigationController?.view.backgroundColor = .white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.makeNavBarInvisible()
        self.navigationController?.view.backgroundColor = .white
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.makeNavBarInvisible()
        self.navigationController?.view.backgroundColor = .white
    }
}

//MARK: Delegate & Datasource

extension SlideShowViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let slideShowCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideShowCollectionViewCell.identifier, for: indexPath) as! SlideShowCollectionViewCell
        slideShowCollectionCell.placeImageView.image = images[indexPath.row]
        return slideShowCollectionCell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / screenWidth)
        slideShowPageControl.currentPage = Int(pageIndex)
    }
}

//MARK: FlowLayout

extension SlideShowViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.layer.frame.width, height: collectionView.layer.frame.height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsetsMake(0, 0, 0, 0)
        return inset
    }
}

