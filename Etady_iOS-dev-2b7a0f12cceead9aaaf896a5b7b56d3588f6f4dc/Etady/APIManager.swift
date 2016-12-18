//
//  APIManager.swift
//  Etady
//
//  Created by trung on 11/30/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON

public class APIManager {
    
   public static let ETADY_HOST = "http://etady.com/"
    
//SignUP

//Login
    public static func login(username:String, password:String, token:String) -> JSON {
        var data:JSON=nil
        //Check is logined
        if SystemUtils.checkConnected(){
            let parameters = [
                "user_name": username,
                "password":password,
                "access_token":token]
            Alamofire.request(.POST,ETADY_HOST+"api/user/login", parameters: parameters, encoding: .URL)
                .responseJSON { response in
                    print(response.result)   // result of response serialization
                    data = JSON(response.result.value!)
            }
            
        }
        return data
    }

// Place google
    public static func searchPlace(query:String, lat:Double, long:Double, radius:Double) -> JSON {
        var data:JSON=nil
        //Check is logined
        if SystemUtils.checkConnected(){
            let parameters = [
                "query": query,
                "latitude":lat as! String,
                "longitude":long as! String,
                "radius":radius as! String]
            Alamofire.request(.POST, ETADY_HOST+"api/place/goo", parameters: parameters, encoding: .URL)
                .responseJSON { response in
                    print(response.result)   // result of response serialization
                    data = JSON(response.result.value!)
            }
            
        }
        return data
    }

    public static func velocityRoad(lat1: Double, long1:Double, lat2:Double, long2:Double) -> JSON {
        var data:JSON=nil
        if SystemUtils.checkConnected(){
            let parameters = [
                "latitude1":lat1 as! String,
                "longitude1":long1 as! String,
                "latitude2":lat2 as! String,
                "longitude2":long2 as! String
                ]
            Alamofire.request(.POST, ETADY_HOST+"api/road", parameters: parameters, encoding: .URL)
                .responseJSON { response in
                    print(response.result)   // result of response serialization
                    data = JSON(response.result.value!)
            }
            
        }
        return data
    }
    
    public static func reportsByGroups(token:String) -> JSON {
        var data:JSON=nil
            if SystemUtils.checkConnected(){
                let parameters = [
                    "access_token":token]
                Alamofire.request(.POST, ETADY_HOST+"api/warning/all", parameters: parameters, encoding: .URL)
                    .responseJSON { response in
                        print(response.result)   // result of response serialization
                        data = JSON(response.result.value!)
                }
                
            }
        return data
    }

    
    public static func createReport(token:String, imgName:String, imgSrc:String, tags:String, latitude:Double, longitude:Double, description:String, isPrivate:Bool, bearing:Double, speed:Double ) -> JSON {
    var data:JSON=nil
    if SystemUtils.checkConnected(){
    let parameters = [
    "access_token":token,
    "img_name":imgName,
    "img_src":imgSrc,
    "tags":tags,
    "latitude":latitude as!String,
    "longitude":longitude as! String,
    "description":description,
    "is_private":isPrivate as! String,
    "orientation":bearing as! String,
    "speed": speed as! String]
        Alamofire.request(.POST, ETADY_HOST+"api/warning/create", parameters: parameters, encoding: .URL)
    .responseJSON { response in
    print(response.result)   // result of response serialization
    data = JSON(response.result.value!)
    }
    
    }
    return data
    }
    
    
    public static func createReport(token:String, warning_id:Int, vote: Int) -> JSON {
        var data:JSON=nil
        if SystemUtils.checkConnected(){
            let parameters = [
                "access_token":token,
                "warning_id": warning_id,
                "vote":vote]
            Alamofire.request(.POST, ETADY_HOST+"api/warning/create", parameters: parameters as! [String : AnyObject], encoding: .URL)
                .responseJSON { response in
                    print(response.result)   // result of response serialization
                    data = JSON(response.result.value!)
            }
            
        }
        return data
    }
    
    public static func getGroup(token:String, group_Id:Int) -> JSON {
        var data:JSON = nil
        if SystemUtils.checkConnected(){
            let parameters = [
                "access_token":token,
                "report_group_id": 2140]
            print(parameters)
            Alamofire.request(.POST, ETADY_HOST+"api/warning/getgroup", parameters: parameters as! [String : AnyObject], encoding: .URL)
                .responseJSON { response in
                    print("get data")
                    print(response.result.value!)
                    data = JSON(response.result.value!)
                    print("data json")
            }            
        }
        print (data)
        return data
    }

}


