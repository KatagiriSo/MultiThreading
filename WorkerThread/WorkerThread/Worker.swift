//
//  Worker.swift
//  WorkerThread
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class Worker {
    let name:String
    let commandManager:CommandManager
    public init (name:String, commandManager:CommandManager) {
        self.name = name
        self.commandManager = commandManager
    }
    
    public func run() {
        while true {
            let command = commandManager.takeCommand()
            command.execute(worker: name)
        }
    }
}
