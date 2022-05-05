//
//  smallGiftCardCVDataSource.swift
//  Multiple_Horizontal_CV
//
//  Created by MacBook on 05/05/2022.
//

import UIKit

class smallGiftCardCVDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
     fileprivate var GiftCards = [GiftCardModel]()
    init(GiftCards: [GiftCardModel]) {
        self.GiftCards = GiftCards
    }
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return GiftCards.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! GiftCardCollectionViewCell
           cell.setup(giftCardModel: GiftCards[indexPath.item])
           return cell
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let width = collectionView.bounds.width/2 - 50
           let height = width / 1.5
           return CGSize(width: width, height: height)
       }
       

   }


