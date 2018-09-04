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
    @IBOutlet weak var slideShowNavigationItem: UINavigationItem!
    var pixabayImages : [PixabayImage]?
    
    private var screenSize: CGRect!
    private var screenWidth: CGFloat!
    private var screenHeight: CGFloat!
    private var oneFourthWidth: CGFloat!
    
    var navTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNav()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.screenSize = UIScreen.main.bounds
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
        if let imageCount = pixabayImages?.count {
            slideShowPageControl.numberOfPages = imageCount
        }
        self.slideShowNavigationItem.title = navTitle
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
        return self.pixabayImages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let slideShowCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideShowCollectionViewCell.identifier, for: indexPath) as! SlideShowCollectionViewCell
        if let images = self.pixabayImages {
            let image = images[indexPath.row]
            slideShowCollectionCell.setUp(withImage: image)
            self.favoritesLabel.text = "\(String(describing: image.likes))K"
            self.visitsLabel.text = "\(String(describing: image.favorites))"
            self.placeDescriptionLabel.text = ""
        }
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

