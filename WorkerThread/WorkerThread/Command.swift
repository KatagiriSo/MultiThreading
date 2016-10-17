//
//  Command.swift
//  WorkerThread
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class Command {
    
    let by:String
    let num:Int
    
    init (_ i:Int, name:String) {
        num = i
        self.by = name
    }
    
    public func execute(worker:String) {
        print("\(worker) execute command \(num) by \(by)")
        Thread.sleep(forTimeInterval: 1.0)
    }
}
