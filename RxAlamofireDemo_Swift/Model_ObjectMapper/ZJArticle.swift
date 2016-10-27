//
//  ZJUser.swift
//  HttpDemo_Swift
//
//  Created by 张剑 on 16/4/20.
//  Copyright © 2016年 张剑. All rights reserved.
//

import Foundation
import ObjectMapper
struct ZJArticle: Mappable {
    var title: String!
    var keywords: String!
    var description: String!
    var date: String!
    var path: String!
    var url: String!
    
    init?(map: Map) {
        
    }
    
    // Mappable
    mutating func mapping(map: Map) {
        title    <- map["title"]
        keywords   <- map["keywords"]
        description   <- map["description"]
        date   <- map["date"]
        path   <- map["path"]
        url   <- map["url"]
    }
}
