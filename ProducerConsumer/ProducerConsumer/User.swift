//
//  User.swift
//  ProducerConsumer
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class User {
    internal let stocker:Stocker
    internal let name:String
    init(name:String, stocker:Stocker) {
        self.name = name
        self.stocker = stocker
    }
    
    public func run() {
        while true {
            let product:Product = stocker.take()
            print("\(name) take \(product.description())")
            
            let time:Double = Double((arc4random() % 1000)) / 1000
            Thread.sleep(forTimeInterval: time)
        }
    }
    
    
    
}
