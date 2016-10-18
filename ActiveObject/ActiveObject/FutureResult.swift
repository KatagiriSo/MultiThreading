//
//  FutureResult.swift
//  ActiveObject
//
//  Created by 片桐奏羽 on 2016/10/18.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class FutureResult<T> : Result<T> {
    
    private var result:Result<T>? = nil
    private var ready:Bool = false
    private let semaphore:DispatchSemaphore = DispatchSemaphore(value: 0)
    
    public func setResult(result:Result<T>) {
        objc_sync_enter(self)
        
        self.result = result
        self.ready = true
        
        objc_sync_exit(self)
        
        semaphore.signal()
        
    }
    
    public override func getResult()->T {
        objc_sync_enter(self)
        
        while !ready {
            
            objc_sync_exit(self)
            semaphore.wait()
            objc_sync_enter(self)
            
        }
        
        objc_sync_exit(self)
        
        return result!.getResult()
    }
    
    
}
