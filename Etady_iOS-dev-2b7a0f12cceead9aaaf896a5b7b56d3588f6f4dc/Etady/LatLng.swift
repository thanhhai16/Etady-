//
//  LatLng.swift
//  Etady
//
//  Created by trung on 11/20/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import Foundation
public class LatLng:AnyObject{
    public var latitude:Double?
    public var longitude:Double?
    public func LatLng(latitude:Double, longitude:Double){
        self.latitude=latitude
        self.longitude=longitude
    }
}
