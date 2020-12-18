//
//  User.swift
//  ActiveObject
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation



public class DispUser {
    private let activeObject:ActiveObject
    private let name:String
    
    public init(name:String, activeObject:ActiveObject) {
        self.name = name
        self.activeObject = activeObject
    }
    
    public func run() {
        var i = 0
        while true {
            print("\(name) request display " + name + "\(i)")
            activeObject.display(name + "\(i)")
            Thread.sleep(forTimeInterval: 0.2)
            i = i + 1
        }
    }

}

public class CommandUser {
    private let activeObject:ActiveObject
    private let name:String
    
    public init(name:String, activeObject:ActiveObject) {
        self.name = name
        self.activeObject = activeObject
    }
    
    public func run() {
        var i:Int = 0
        while true {
            print("\(name) request command " + "\(i)")
            let result:Result<String> = activeObject.request(command:i)
            Thread.sleep(forTimeInterval: 0.01)
            let v = result.getResult()
            print("\(name) request command \(i) result \(v)")
            i = i + 1
        }
    }
}
