//
//  SharingCategory.swift
//  Etady
//
//  Created by trung on 11/29/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import Foundation
public class SharingCategory{
    
    // index
    private static let  TRAFFIC_JAM_INDEX = 1
    private static let  ACCIDENT_INDEX = 2
    private static let  CLOSURE_INDEX = 3
    private static let  HAZARD_INDEX = 4
    private static let  PAVE_ROAD_INDEX = 5
    private static let  ONEWAY_INDEX = 6
    private static let  CHAT_INDEX = 7
    private static let  CAMERA_INDEX = 8
    private static let  FEEDBACK_INDEX = 10
    private static let  PRIVATE_LOCATION_INDEX = 9
    private static let  FLOOD_INDEX = 11
    private static let  LANES_INDEX = 12
    private static let  TRAFFIC_SIGNS_INDEX = 13
    private static let  TRAFFIC_LIGHTS_INDEX = 14
    private static let  TRAFFIC_SLOW_MOVING_INDEX = 15
    private static let  SIGNAL_INDEX = 16
    private static let  SPEED_LIMIT_INDEX = 17
    private static let  FALLEN_TREE_INDEX = 18
    private static let  LANDSLIDE_INDEX = 19
    private static let  WRONG_DATA_INDEX = 20
    
    public static let PinIcons:[String] = [
        "ic_pin_traffic_jam",
        "ic_pin_accident",
        "",
        "ic_pin_hazard",
        "",
        "",
        "ic_pin_chat_normal",
        "ic_pin_camera_normal",
        "",
        "ic_pin_private_location",
        "ic_pin_flood",
        "ic_pin_lanes",
        "ic_pin_traffic_sign",
        "ic_pin_traffic_light",
        "ic_pin_slow_moving",
        "ic_pin_turning_signal",
        "ic_pin_speed_limit",
        "ic_pin_fallen_tree",
        "ic_pin_landslide",
        "ic_pin_wrong_data"
    ]
    public static let pinTitles:[String] = [
        "tắc đường",
        "tai nạn",
        "chú ý",
        "nguy hiểm",
        "chú ý",
        "chú ý",
        "chat",
        "camera",
        "chú ý",
        "địa điểm cá nhân",
        "lụt",
        "làn đường",
        "biển báo",
        "đèn tín hiệu",
        "đi chậm",
        "xin nhan",
        "tốc độ",
        "cây đổ",
        "lở đất",
        "sai dữ liệu"
    ]
    public static let pinTitlesUppered:[String] = [
    "TẮC ĐƯỜNG",
    "TAI NẠN",
    "CHÚ Ý",
    "NGUY HIỂM",
    "CHÚ Ý",
    "CHÚ Ý",
    "CHAT",
    "CAMERA",
    "CHÚ Ý",
    "ĐỊA ĐIỂM CÁ NHÂN",
    "ĐƯỜNG NGẬP",
    "LÀN ĐƯỜNG",
    "BIỂN BÁO",
    "ĐÈN TÍN HIỆU",
    "ĐI CHẬM",
    "XIN NHAN",
    "GIỚI HẠN TỐC ĐỘ",
    "CÂY ĐỔ",
    "LỞ ĐẤT",
    "SAI DỮ LIỆU"
    ]
    //
    //get tag
    public static func getPrimaryTag(tags:[Int]) -> Int{
        var primaryTag = SharingCategory.HAZARD_INDEX
        if tags.count==1{
            primaryTag = tags[0]
        }
        return primaryTag
    }
    public static func getIcon(tag:Int) -> String{
        return PinIcons[tag-1]
    }
}
