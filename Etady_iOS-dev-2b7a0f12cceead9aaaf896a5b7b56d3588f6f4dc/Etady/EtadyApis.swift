//
//  EtadyApis.swift
//  Etady
//
//  Created by trung on 11/15/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import Foundation
public class EtadyApis {
    public class EtadyApis {
        public static let  RESPONSE_SUCCESS = 0
        public static let  RESPONSE_JSON_READER_ERROR = -1
        public static let  RESPONSE_IO_ERROR = -2
        public static let  RESPONSE_ERR_MISSING_INFO = 1
        public static let  RESPONSE_ERR_DATA_INCORRECT = 2
        public static let  RESPONSE_ERR_USER_EXISTED = 3
        public static let  RESPONSE_ERR_EMAIL_EXISTED = 4
        public static let  RESPONSE_ERR_PASSWORD_INCORRECT = 5
        public static let  RESPONSE_ERR_DATA_NOT_FOUND = 6
        public static let  RESPONSE_ERR_COORDINATE_NOT_FOUND = 11
        public static let  RESPONSE_ERR_ROUTING_NOT_FOUND = 12
        
        
        public static let  KEY_USERNAME = "username"
        public static let  KEY_PASSWORD = "password"
        public static let  KEY_EMAIL = "email"
        public static let  POST_KEY_FIRSTNAME = "first_name"
        public static let  POST_KEY_LASTNAME = "last_name"
        public static let  POST_KEY_PHONE = "phone"
        public static let  POST_KEY_ADDRESS = "address"
        public static let  POST_KEY_ACCESS_TOKEN = "access_token"
        public static let  POST_KEY_TAGS = "tags" // Traffic jam, Police,...
        public static let  POST_KEY_LONGITUDE = "longitude"
        public static let  POST_KEY_LATITUDE = "latitude"
        public static let  POST_KEY_DESCRIPTION = "description"
        public static let  POST_KEY_SHARE_PRIVATELY = "is_privated" // Public or Private...
        public static let  POST_KEY_LOCATION_ID = "warning_id"
        public static let  POST_KEY_ID = "id"
        public static let  POST_KEY_IDS = "ids"
        public static let  POST_KEY_DATE_CREATED = "created_at"
        public static let  POST_KEY_CURRENT_TIME = "current_time"
        public static let  POST_KEY_OWNED = "owned"
        public static let  POST_KEY_COMMENT = "comment"
        public static let  KEY_COMMENT_ID = "comment_id"
        public static let  KEY_REPORT_VOTE = "vote"
        public static let  KEY_REPORT_MY_VOTE = "my_vote"
        public static let  KEY_UP_VOTE = "up_vote"
        public static let  KEY_DOWN_VOTE = "down_vote"
        public static let  KEY_COMMENT_USER_ID = "user_id"
        public static let  KEY_COMMENT_TIME_CREATED = "created_at"
        public static let  KEY_NUMBER_OF_COMMENT = "number_of_comment"
        public static let  KEY_NAME = "name"
        public static let  KEY_PIN_GROUP_CENTER = "centroid"
        public static let  KEY_RADIUS = "radius"
        public static let  KEY_DATE = "date"
        public static let  KEY_ROUTING_FROM = "from"
        public static let  KEY_ROUTING_TO = "to"
        
        private static let  CONNECTION_TIMEOUT = 30000
    }
}
