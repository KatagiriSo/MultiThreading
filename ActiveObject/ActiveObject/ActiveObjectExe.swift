//
//  ActiveObjectExe.swift
//  ActiveObject
//
//  Created by KatagiriSo on 2016/10/18.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class ActiveObjectExe:ActiveObject {
    public typealias S = String

    public func request(command: Int) -> Result<String> {
        Thread.sleep(forTimeInterval: TimeInterval(command % 10)/5.0)
        let result = JustResult("command \(command) OK")
        return result
    }
    
    public func display(_ s: String) {
        print(s)
    }
}
