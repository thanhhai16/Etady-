//
//  PinReportGroup.swift
//  Etady
//
//  Created by trung on 11/20/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import Foundation
import Mapbox
import SwiftyJSON
class PinReportGroup: NSObject, MGLAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var id:Int
    var mainTag:Int
//    var ids:[Int]?
    var icon: String
    var lasKnownLocationOnScreen:PointF?
    init(data:JSON) {
        self.id = data["report_group_id"].int!
        self.mainTag = data["tags"].arrayValue[0].int!
        self.coordinate=CLLocationCoordinate2D(latitude: Double(data["latitude"].string!)!, longitude: Double(data["longitude"].string!)!)
        self.title = data["report_group_id"].double! as? String
        self.icon = SharingCategory.getIcon(mainTag)
        self.subtitle = icon
    }
    
//        public func getLastKnownLocationOnScreen() -> PointF {
//        return lastKnownLocationOnScreen!;
//        }
//    
//        public func setLastKnownLocationOnScreen( lastKnownLocationOnScreen:PointF) {
//        self.lastKnownLocationOnScreen = lastKnownLocationOnScreen;
//        }
    }


