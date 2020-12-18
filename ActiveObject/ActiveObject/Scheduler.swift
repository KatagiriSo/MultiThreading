//
//  Scheduler.swift
//  ActiveObject
//
//  Created by KatagiriSo on 2016/10/18.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class Scheduler<S> {
    
    private let queue:ActiveQueue<S>
    
    public init(queue:ActiveQueue<S>) {
        self.queue = queue
    }
    
    public func invoke(request:Request<S>) {
        queue.putRequest(request: request)
    }
    
    public func run() {
        while true {
            let req:Request<S> = queue.takeRequest()
            req.execute()
        }
    }
    
}
