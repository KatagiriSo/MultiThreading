//
//  ActiveQueue.swift
//  ActiveObject
//
//  Created by 片桐奏羽 on 2016/10/18.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation


public class ActiveQueue<S> {
    
    private let MaxRequest:Int = 100
    private var requests:[Request<S>] = []
    private let semaphore:DispatchSemaphore = DispatchSemaphore(value: 0)

    
    public func putRequest(request:Request<S>) {
        objc_sync_enter(self)
        while requests.count >= MaxRequest {
            objc_sync_exit(self)
            semaphore.wait()
            objc_sync_enter(self)
        }
        
        requests.append(request)
        objc_sync_exit(self)

        semaphore.signal()
    }
    
    public func takeRequest()->Request<S> {
        objc_sync_enter(self)
        while requests.count <= 0 {
            objc_sync_exit(self)
            semaphore.wait()
            objc_sync_enter(self)
        }
        
        let req:Request<S> = requests.first!
        requests = requests.dropFirst().map {$0}
        objc_sync_exit(self)
        
        return req
    }
}
