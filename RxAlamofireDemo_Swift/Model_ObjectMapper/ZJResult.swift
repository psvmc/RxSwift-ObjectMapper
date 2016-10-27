//
//  ZJResult.swift
//  HttpDemo_Swift
//
//  Created by 张剑 on 16/4/20.
//  Copyright © 2016年 张剑. All rights reserved.
//

import Foundation
import ObjectMapper
struct ZJResult<T: Mappable>: Mappable {
    var success: Bool!
    var msg: String!
    var obj: [T]?
    
    
    init?(map: Map) {
        
    }
    
    // Mappable
    mutating func mapping(map: Map) {
        success     <- map["success"]
        msg         <- map["msg"]
        obj         <- map["obj"]
    }
}
