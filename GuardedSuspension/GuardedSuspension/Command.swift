//
//  Command.swift
//  GuardedSuspension
//
//  Created by KatagiriSo on 2016/10/14.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class Command : Equatable {
    let name:String
    
    init (name:String) {
        self.name = name
    }
    
    static public func ==(left:Command, right:Command) -> Bool {
        return left.name == right.name
    }
    
    public func toString()->String {
        return "Command \(name)"
    }
}
