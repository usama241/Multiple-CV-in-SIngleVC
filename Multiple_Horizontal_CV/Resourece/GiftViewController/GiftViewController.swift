//
//  GiftViewController.swift
//  WiredBrainCoffee
//
//  Created by Mark Moeykens on 3/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import UIKit

class GiftViewController: UIViewController {
    
    @IBOutlet weak var hightConstraint: NSLayoutConstraint!
    @IBOutlet weak var hightConstraintThankYou: NSLayoutConstraint!
    
    @IBOutlet weak var seasonalCollectionView: UICollectionView!
    @IBOutlet weak var thankYouVC: UICollectionView!
    
    var seasonalGiftCards = [GiftCardModel]()
    var thankyouDataSource : smallGiftCardCVDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seasonalCollectionView.dataSource = self
        seasonalCollectionView.delegate = self
        
        GiftCardFunctions.getSeasonalGiftCards { [weak self] (cards) in
            guard let self = self else { return }
            self.seasonalGiftCards = cards
            self.seasonalCollectionView.reloadData()
        }
        GiftCardFunctions.getThankYouGiftCards { [weak self] (cards) in
            guard let self = self  else { return }
            self.thankyouDataSource = smallGiftCardCVDataSource(GiftCards: cards)
            self.thankYouVC.dataSource = self.thankyouDataSource
            self.thankYouVC.delegate = self.thankyouDataSource
            self.thankYouVC.reloadData()
        }
        setHeightOfCollectionView()
    }
  
        func setHeightOfCollectionView() {
        let width = seasonalCollectionView.bounds.width - 50
        let height = width / 1.5
        hightConstraint.constant = height
            hightConstraintThankYou.constant = height/2        }
    
}

extension GiftViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasonalGiftCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! GiftCardCollectionViewCell
        cell.setup(giftCardModel: seasonalGiftCards[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 50
        let height = width / 1.5
        return CGSize(width: width, height: height)
    }
    

}
