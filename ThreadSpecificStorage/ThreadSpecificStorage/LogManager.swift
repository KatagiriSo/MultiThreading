//
//  LogManager.swift
//  ThreadSpecificStorage
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class LogManager {
    private static var loggerPool:[Int:Logger] = [:]
    
    private static func getLogger()->Logger {
        let h = Thread.current.hash
        if let logger:Logger = loggerPool[h] {
            return logger
        } else {
            let locker = Locker()
            let l = Logger(locker: locker)
            print("make logger \(h)")
            objc_sync_enter(self)
            loggerPool[h] = l
            objc_sync_exit(self)

            return l
        }
    }
    
    public static func log(_ s:String) {
        getLogger().log(s)
    }
    
    public static func allLog() {
        for logger in loggerPool.values {
            print("\""+logger.result().joined(separator: " ")+"\"")
        }
    }
}
