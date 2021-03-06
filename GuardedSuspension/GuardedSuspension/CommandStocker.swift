//
//  CommandStocker.swift
//  GuardedSuspension
//
//  Created by KatagiriSo on 2016/10/14.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

func sync(_ lock:AnyObject, handle:()->Void) {
    objc_sync_enter(lock)
    handle()
    objc_sync_exit(lock)
}

public class CommandStocker {
    private var list:Array<Command> = []
    private let semaphore:DispatchSemaphore = DispatchSemaphore(value: 0)
    
    public func getCommand()->Command {
        
        var command:Command? = nil
        
        objc_sync_enter(self)

        
            // guard condition
            while self.list.count == 0 {
                print("wait..")
                objc_sync_exit(self)
                semaphore.wait()
                objc_sync_enter(self)
            }
            
            
            let list = self.list

            if let com:Command = list.first {
                
                let index = list.index(of: com)
                if let index = index {
                    self.list.remove(at: index)
                }
                
                command = com
            } else {
                print("[Error] command is nil")
                command = Command(name: "dummy")
            }
    
        objc_sync_exit(self)
        
        return command!
    }
    
    public func putCommand(command:Command) {
        objc_sync_enter(self)
        list.append(command)
        objc_sync_exit(self)

        let ret = semaphore.signal()
        print("signal \(ret)")

    }
    
}
