//
//  CommandServer.swift
//  GuardedSuspension
//
//  Created by KatagiriSo on 2016/10/14.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class CommandServer {
    let commandStcoker:CommandStocker
    
    init (stocker:CommandStocker) {
        commandStcoker = stocker
    }
    
    public func run() {
        while true {
            let command = commandStcoker.getCommand()
            print("command accept ..." + command.toString())
            
            let time:Double = Double((arc4random() % 100)) / 1000
            Thread.sleep(forTimeInterval: TimeInterval(time))
        }
    }
}
