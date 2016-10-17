//
//  Future.swift
//  Future
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class Future:Request {
    private let semaphore:DispatchSemaphore = DispatchSemaphore(value: 0)
    private var ready = false
    private var result:Result? = nil
    
    public func setResult(result:Result) {
        if ready {
            return
        }
        
        self.result = result
        self.ready = true
        
        semaphore.signal()
    }
    
    public func getResult() -> String {
        objc_sync_enter(self)
        
        while !ready {
            objc_sync_exit(self)
            semaphore.wait()
            objc_sync_enter(self)
        }
        
        objc_sync_exit(self)
        
        return self.result!.getResult()
        
    }
}
