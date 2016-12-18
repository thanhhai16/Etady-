//
//  ReportGroup.swift
//  Etady
//
//  Created by trung on 12/12/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

//
//  Report.swift
//  Etady
//
//  Created by trung on 11/25/16.
//  Copyright © 2016 IDNsystems. All rights reserved.

import Foundation
import SwiftyJSON
import CoreLocation
public class ReportGroup:NSObject{
    public var reportGroupId:Int
    public var tags:[JSON]
    public var backGroundColor:Int?
    public var  coordinate: CLLocationCoordinate2D
    
    init(data:JSON) {
        self.coordinate = CLLocationCoordinate2D(latitude: Double(data["latitude"].string!)!, longitude: Double(data["longitude"].string!)!)
        self.reportGroupId = data["report_group_id"].int!
        self.tags = data["tags"].arrayValue

    }
    
//    override public func isEqual(object: AnyObject?) -> Bool {
//        return (object is Report) && ((object as! Report).name==self.name)
//    }
    
}

