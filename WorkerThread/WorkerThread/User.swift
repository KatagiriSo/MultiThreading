//
//  User.swift
//  WorkerThread
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation



public class User {
    let name:String
    let commandManager:CommandManager
    
    init (name:String, commandManager:CommandManager) {
        self.name = name
        self.commandManager = commandManager
    }
    
    
    public func run() {
        var i = 0
        while true {
            let command = Command(i, name:name)
            i = i + 1
            commandManager.putCommand(command)
            Thread.sleep(forTimeInterval: 1.0)
        }
    }
}
