//
//  ReportGroupPin.swift
//  Etady
//
//  Created by trung on 12/12/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import UIKit
import GoogleMaps
class ReportGroupPin: GMSMarker {
    let place: ReportGroup
    
    init(place: ReportGroup) {
        self.place = place
        super.init()
        title = "Etady"
        icon = UIImage(named: "pin_icon")   
        position = place.coordinate
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = kGMSMarkerAnimationPop
    }
}
