//
//  User.swift
//  ThreadSpecificStorage
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class User {
    private let id:Int
    
    init(id:Int) {
        self.id = id
    }
    
    public func run() {
        var c = 0
        while c<10 {
            LogManager.log("\(id)")
            c = c + 1
            Thread.sleep(forTimeInterval: 0.01)
        }
    }
}
