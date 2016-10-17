//
//  Helper.swift
//  ThreadPerMessage
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class Helper {
    public func hundle(request:Request) {
        switch request {
        case let .work(id):
            Thread.sleep(forTimeInterval: 3.0)
            print("work\(id) done")
        }
    }
}
