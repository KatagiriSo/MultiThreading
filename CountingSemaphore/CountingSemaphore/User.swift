//
//  User.swift
//  CountingSemaphore
//
//  Created by 片桐奏羽 on 2016/10/14.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class User {
    internal let resource:Resouce
    public let name:String
    init(resource:Resouce, name:String) {
        self.resource = resource
        self.name = name
    }
    
    public func run() {
        
        do {
            while true {
                print("\(self.name) tryUse")
                try resource.use(user: self)
                let time:Double = Double((arc4random() % 3000))/1000
                print("\(self.name) sleep \(time)")
                Thread.sleep(forTimeInterval: TimeInterval(time))
                print("\(self.name) begin")
            }
        } catch {
            print("exception")
        }
    }
}
