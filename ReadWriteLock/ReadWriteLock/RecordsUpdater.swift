//
//  RecordsUpdater.swift
//  ReadWriteLock
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class RecordUpdater {
    internal let stocker:RecordStocker
    internal var index:Int = 0
    
    public init(stocker:RecordStocker) {
        self.stocker = stocker
    }
    
    public func run() {
        
        while true {
            
            let number = arc4random() % 10
            var list:[Record] = []
            for _ in 0...number {
                let record = Record(uid: index)
                index = index + 1
                list.append(record)
            }
            
            stocker.list = list
            
            
            let time:Double = Double((arc4random() % 3000)) / 1000
            Thread.sleep(forTimeInterval: time)
            
        }
        
    }
}
