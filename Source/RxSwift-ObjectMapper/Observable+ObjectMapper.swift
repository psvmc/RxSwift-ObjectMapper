//
//  Observable+ObjectMapper.swift
//  RxAlamofireDemo_Swift
//
//  Created by 张剑 on 16/4/21.
//  Copyright © 2016年 张剑. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

/**
 *  JSON转换错误
 */
struct ZJObjectError : Error {
    let domain: String
    let code: Int
    let message: String

    
    var _domain: String {
        return domain
    }
    
    var _code: Int {
        return code
    }
    
    var _message: String {
        return message
    }
}

// MARK: - 扩展ObservableType 转换String为为对象
public extension ObservableType where E == String {

    public func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        
        return flatMap { response -> Observable<T> in
            guard let result = Mapper<T>().map(JSONString:response) else {
                let error = ZJObjectError(domain:"ObjectMapper",code:100,message:"JSON转换错误");
                throw error;
            }
            return Observable.just(result);
        }
    }
    

    public func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            guard let result = Mapper<T>().mapArray(JSONString:response) else {
                let error = ZJObjectError(domain:"ObjectMapper",code:100,message:"JSON转换错误");
                throw error;
            }
            return Observable.just(result);
        }
    }
}
