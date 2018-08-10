//
//  OnboardingViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/8/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var onboardPageControl: UIPageControl!
    
    private let images = [UIImage(named: "travel-onboarding-1"),
                          UIImage(named: "travel-onboarding-2"),
                          UIImage(named: "travel-onboarding-3"),
                          UIImage(named: "travel-onboarding-4")]
    
    private let messages = ["Explore travel destinations",
                            "Find cheap flight and more savings",
                            "Checkout best restuarants nearby",
                            "There's more comfort where you'll sleep"]
    
    private var screenSize: CGRect!
    private var screenWidth: CGFloat!
    private var screenHeight: CGFloat!
    private var oneFourthWidth: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNav()
        self.onboardingCollectionView.delegate = self
        self.onboardingCollectionView.dataSource = self
        self.screenSize = UIScreen.main.bounds
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.hideNav()
        self.loadViewIfNeeded()
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.showNav()
    }
}

//MARK: Delegate & Datasource

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let onboardcell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        onboardcell.setUp(withImage: images[indexPath.row]!, message: messages[indexPath.row])
        onboardcell.layer.borderColor = UIColor.clear.cgColor
        return onboardcell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / screenWidth)
        onboardPageControl.currentPage = Int(pageIndex)
    }
}

//MARK: FlowLayout

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
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

