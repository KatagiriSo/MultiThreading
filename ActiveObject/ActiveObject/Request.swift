//
//  Request.swift
//  ActiveObject
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class Request<T> {
    internal let exe:ActiveObjectExe
    internal let future:FutureResult<T>?
    
    init(exe:ActiveObjectExe, future:FutureResult<T>?) {
        self.exe = exe
        self.future = future
    }
    
    public func execute() {
        assert(false, "abstract class")
    }
}
