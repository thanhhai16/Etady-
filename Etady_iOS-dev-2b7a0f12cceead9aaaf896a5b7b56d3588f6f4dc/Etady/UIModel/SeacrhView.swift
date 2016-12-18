//
//  SeacrhView.swift
//  Etady
//
//  Created by Hai on 12/16/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import UIKit

class SearchView : UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    let nameLabel = ["Trạm Xăng","Đỗ Xe", "Gara", "Xem Thêm"]
    let nameImage = ["1.png","2.png","3.png","4.png"]
    
    func setUI () {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView.registerNib(nib, forCellWithReuseIdentifier: "CollectionViewCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        cell.style = styleNormal
        cell.index = indexPath.row
        cell.setUI()
        cell.btn.setBackgroundImage(UIImage(named: self.nameImage[indexPath.row]), forState: .Normal)
        cell.label.text = self.nameLabel[indexPath.row]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.frame.width/4, height: self.frame.height)
    }
    
    
    
    
}
