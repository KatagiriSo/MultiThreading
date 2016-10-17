//
//  RecordStocker.swift
//  ReadWriteLock
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class RecordStocker {
    private var _list:[Record] = []
    public var list:[Record] {
        get {
            var r:[Record]
            lock.readLock()
            r = self._list
            lock.unreadLock()
            return r
        }
        
        set(newValue) {
            lock.writeLock()
            self._list = newValue
            Thread.sleep(forTimeInterval: 0.05)
            lock.unwriteLock()
        }
    
    }
    
    internal let lock:ReadWriteLock = ReadWriteLock()
    
    
    
    
}
