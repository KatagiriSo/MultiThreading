//
//  Logger.swift
//  ThreadSpecificStorage
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class Locker {
    public var list:[String] = []
}

public class Logger {
    
    private let locker:Locker
    
    public init(locker:Locker) {
        self.locker = locker
    }
    
    public func log(_ s:String) {
        locker.list.append(s)
    }
    
    public func result()->[String] {
        return locker.list
    }
}
