//
//  Report.swift
//  Etady
//
//  Created by trung on 11/25/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import Foundation
public class Report:NSObject{
    public var name:String
    public var title: String
    public var index:Int
    public var imageId:Int
    public var pinImageId:Int
    public var backGroundColor:Int
    
    init(name:String, title:String, index:Int, imageId:Int, pinImageId:Int, bgC:Int) {
        self.name=name
        self.title=title
        self.index=index
        self.imageId=imageId
        self.pinImageId=pinImageId
        self.backGroundColor=bgC
    }
    
    override public func isEqual(object: AnyObject?) -> Bool {
        return (object is Report) && ((object as! Report).name==self.name)
    }
    
}
