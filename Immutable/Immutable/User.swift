//
//  User.swift
//  Immutable
//
//  Created by KatagiriSo on 2016/10/14.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class User {
    let name:String
    let age:Int
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }

    // concurrent
    public func toString()->String {
        return "\(name) - \(age)"
    }
}
