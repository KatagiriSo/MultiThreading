//
//  User.swift
//  GuardedSuspension
//
//  Created by KatagiriSo on 2016/10/14.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class User {
    let commandStocker:CommandStocker
    let name:String
    
    init (stocker:CommandStocker, name:String) {
        commandStocker = stocker
        self.name = name
    }
    
    public func run() {
        var i = 0
        while true {
            let command = Command(name: "command \(i)")
            print(name+"put command \(command.name)")
            commandStocker.putCommand(command: command)
            let time:Double = Double((arc4random() % 200)) / 1000
            Thread.sleep(forTimeInterval: TimeInterval(time))
            i = i + 1
        }
    }
}
