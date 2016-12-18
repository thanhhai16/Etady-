//
//  CollectionViewCell.swift
//  Etady
//
//  Created by Hai on 12/17/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import UIKit

class CollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var style : Int!
    var index : Int!
    static let share = CollectionViewCell()
    var check = false
    func setUI () {
        self.layoutIfNeeded()
        self.btn.layer.cornerRadius = self.btn.frame.width/2
        self.btn.clipsToBounds = true
    }
    @IBAction func touchUpBtn(sender: AnyObject) {
        switch style {
        case styleNormal:
            if self.index == 3 {
                NSNotificationCenter.defaultCenter().postNotificationName("btn", object: nil)
            }
        case styleMore:
            if self.index == 15 {
                NSNotificationCenter.defaultCenter().postNotificationName("btn", object: nil)
            }
        default:
            break
        }
    }
    
    
   }
