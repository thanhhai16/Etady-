//
//  MoreSearchView.swift
//  Etady
//
//  Created by Hai on 12/17/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import UIKit

class MoreSearchView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var labelName = ["Trạm Xăng", "Đỗ Xe", "Gara", "Khách Sạn", "Bar", "Cafe", "Nhà Hàng", "Hiệu Thuốc",
                     "ATM", "Siêu Thị", "Cửa Hàng", "Vui Chơi", "Bệnh Viên", "Công An", "Bus", "Ẩn"]
    
    func setUI () {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let nib  =  UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView.registerNib(nib, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        cell.style = styleMore
        cell.index = indexPath.row
        cell.setUI()
        cell.label.text = labelName[indexPath.row]
        let image = UIImage(named: "m\(indexPath.row + 1).png")
        cell.btn.setBackgroundImage(image, forState: .Normal)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.frame.width/4, height: self.frame.height/4)
    }
}
