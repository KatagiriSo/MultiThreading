//
//  User.swift
//  ReadWriteLock
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class User {
    private let stocker:RecordStocker
    private let name:String
    
    init(stocker:RecordStocker, name:String) {
        self.stocker = stocker
        self.name = name
    }
    
    public func run() {
        while true {
            let list = self.stocker.list
            print("\(name) read list count \(list.count) firstID:\(list.first?.uid)")
            
            let time:Double = Double((arc4random() % 1000)) / 1000
            Thread.sleep(forTimeInterval: time)
        }
    }
}
