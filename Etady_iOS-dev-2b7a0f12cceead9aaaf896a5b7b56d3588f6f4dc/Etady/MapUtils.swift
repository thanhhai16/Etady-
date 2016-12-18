//
//  MapUtils.swift
//  Etady
//
//  Created by trung on 11/22/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import Foundation
import Mapbox
import GoogleMaps
public class MapsUtils {
    
    public static func  gotoMyLocation(mMapView:MGLMapView) -> Bool {
        
    mMapView.showsUserLocation = true
    mMapView.setUserTrackingMode(MGLUserTrackingMode.Follow, animated: false)
    let mylocation = mMapView.userLocation?.location?.coordinate
        SystemUtils.log((mylocation?.latitude)!)
        if(mylocation != nil){
            mMapView.setCenterCoordinate(mylocation!, zoomLevel: 13, animated: true)
            return true

        }
        return false
        
    }
    


    
    public static func shouldShowReportsAsDots(zoom:Double) -> Bool {
    return zoom < 14
    }
}
