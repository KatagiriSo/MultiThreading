//
//  Request.swift
//  ActiveObject
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
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
