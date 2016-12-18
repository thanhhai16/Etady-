//
//  ReportController.swift
//  Etady
//
//  Created by trung on 11/20/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import Foundation
import GoogleMaps
import Alamofire
import SwiftyJSON
public class ReportController: MapsComponentControllerProtocol{
    //Var
    var mMapCallBack:MapCallbackProtocol
    var mMapView:GMSMapView
    
    init(mcb:MapCallbackProtocol, mv:GMSMapView) {
        self.mMapCallBack=mcb
        self.mMapView = mv
        SystemUtils.log("init report controller")
        mMapCallBack.printdemo()
        
    }

    public func onMapLoaded(mv: GMSMapView) {
        mMapView = mv
        SystemUtils.log("onMapLoaded")
        loadAllLocation()
        
    }
    
    private var lasTime:Int64 = 0
    func loadAllLocation() {
        var connected:Bool=false
        var currentTime:Int64
        currentTime = SystemUtils.getCurrentMillis()
        if (currentTime-lasTime<1000) {
            return
        }
        lasTime = currentTime
        //Check internet
        do
        {
            connected = try Reachability.reachabilityForInternetConnection().isReachable()
            
            if connected == true
            {
                print("Internet connection OK")
            }
            else
            {
                print("Internet connection FAILED")
                let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
        }
        catch
        {
            print("Handle Exception")
            
        }
        //Check login
        let token = SystemUtils.getAccessToken()
        if(!SystemUtils.getIsLogin()){
            return
        }
        if connected {
            if(connected){
                let parameters = [
                    "access_token":token]
                
                Alamofire.request(.POST, "http://etady.com/api/warning/all", parameters: parameters, encoding: .URL)
                    .responseJSON { response in
                        print(response.result)   // result of response serialization
                        let data = JSON(response.result.value!)
                        SystemUtils.log(data["error"].double!)
                        SystemUtils.log(data["message"].string!)
                        SystemUtils.log("add data group")
                        if data["error"].intValue == 0{
                            self.addReportGroup(data["data"].arrayValue)
                        }                        
                }
                
            }
            
        }
    }
    
//    func addReportGroup(datas:Array<JSON>) {
//        let data:Array<JSON> = datas
//        SystemUtils.log("latitude 0")
//        SystemUtils.log(data[0]["longitude"].string!)
//        
//        var pointAnnotations = [GMSMarker]()
//        
//        for i in 0...data.count-1 {
//            let position = CLLocationCoordinate2D(latitude: Double(data[i]["latitude"].string!)!, longitude: Double(data[i]["longitude"].string!)!)
//
//            let point = GMSMarker(position: position)
//            point.title = "Etady"
//            point.icon = UIImage(named: "pin_icon")
//            point.map = mMapView
//            pointAnnotations.append(point)
//        }
//        
//    }
    func addReportGroup(datas:Array<JSON>) {
        let data:Array<JSON> = datas
        SystemUtils.log("latitude 0")
        SystemUtils.log(data[0]["longitude"].string!)
        
        var pointAnnotations = [ReportGroupPin]()
        
        for i in 0...data.count-1 {
            let reportGroup = ReportGroup(data: data[i])
            let reportGroupPin = ReportGroupPin(place: reportGroup)
            reportGroupPin.map = mMapView
            pointAnnotations.append(reportGroupPin)
        }
        
    }
    
    func onMarkerClicked(reportId: Double) {
        // get pỉn report group
        // show report Fragment
    }
    
}

