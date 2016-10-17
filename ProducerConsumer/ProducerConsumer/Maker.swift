//
//  Maker.swift
//  ProducerConsumer
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class Maker {
    internal let stocker:Stocker
    public let name:String
    static var id:Int = 0
    public init(name:String, stocker:Stocker) {
        self.name = name
        self.stocker = stocker
    }
    
    public func run() {
        while true {
            
            let time:Double = Double((arc4random() % 1000)) / 1000
            Thread.sleep(forTimeInterval: time)
            
            let p = Product(id: Maker.id, madeBy: name)
            stocker.append(element:p)
            
            objc_sync_enter(self)
            Maker.id = Maker.id + 1
            objc_sync_exit(self)
        }
    }
}
