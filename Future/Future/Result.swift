//
//  Result.swift
//  Future
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class Result : Request {
    private var content:String
    
    public init(_ command:Int) {
        print("request start \(command)")
        Thread.sleep(forTimeInterval: 1.0)
        content = "result = \(command)"
        print("request end \(command)")
    }
    
    public func getResult() -> String {
        return content
    }
    
}
