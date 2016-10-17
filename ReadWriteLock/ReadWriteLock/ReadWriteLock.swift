//
//  ReadWriteLock.swift
//  ReadWriteLock
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class ReadWriteLock {
    
    enum Prefer {
        case Writer
        case None
    }
    
    private let semaphore:DispatchSemaphore = DispatchSemaphore(value: 1)
    private var reader:Int = 0
    private var writer_waiting:Int = 0
    private var writer_writing:Int = 0
    private var preferMode:Prefer = .Writer

    private func readerWaitCondition()->Bool {
        if writer_writing > 0 {
            return true
        }
        
        switch preferMode {
        case .Writer:
            return writer_waiting > 0
        case .None:
            return false
        }
    }
    
    
    public func writerWaitCondition()->Bool {
        if writer_writing > 0 {
            return true
        }
        if reader > 0 {
            return true
        }
        
        return false
    }
    
    
    public func readLock() {
        objc_sync_enter(self)

        while  readerWaitCondition() {
            objc_sync_exit(self)
            print("read wait..")
            semaphore.wait()
            objc_sync_enter(self)
        }
        reader = reader + 1
        
        objc_sync_exit(self)
        
    }
    
    public func unreadLock() {
        reader = reader - 1
        preferMode = .Writer
        semaphore.signal()
    }
    
    public func writeLock() {
        objc_sync_enter(self)
        
        writer_waiting = writer_waiting + 1
        while writerWaitCondition() {
            objc_sync_exit(self)
            print("write wait..")
            semaphore.wait()
            objc_sync_enter(self)
        }
        writer_waiting = writer_waiting - 1
        writer_writing = writer_writing + 1
        
        objc_sync_exit(self)
    }
    
    public func unwriteLock() {
        objc_sync_enter(self)

        writer_writing = writer_writing - 1
        preferMode = .None
        
        objc_sync_exit(self)
        semaphore.signal()
    }
}
