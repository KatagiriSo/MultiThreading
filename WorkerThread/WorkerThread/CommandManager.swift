//
//  CommandManager.swift
//  WorkerThread
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class CommandManager {
    
    private var commandQueue:[Command] = []
    private var workerPool:[Worker] = []
    private let semaphore:DispatchSemaphore = DispatchSemaphore(value: 0)
    
    init (workerNumber:Int) {
        for i in 0...workerNumber {
            let worker = Worker(name: "w\(i)", commandManager: self)
            workerPool.append(worker)
        }
    }
    
    public func start() {
        for worker in workerPool {
            DispatchQueue.global().async {
                worker.run()
            }
        }
    }
    
    public func putCommand(_ command:Command) {
        
        objc_sync_enter(self)
        commandQueue.append(command)
        objc_sync_exit(self)
        
        semaphore.signal()
    }
    
    public func takeCommand()->Command {
        objc_sync_enter(self)
        while commandQueue.count <= 0 {
            objc_sync_exit(self)
            semaphore.wait()
            objc_sync_enter(self)
        }
        
        let command = self.commandQueue.first!
        commandQueue = commandQueue.dropFirst().map{$0}
        objc_sync_exit(self)
        return command
    }
}
