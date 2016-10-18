//
//  Scheduler.swift
//  ActiveObject
//
//  Created by 片桐奏羽 on 2016/10/18.
//  Copyright © 2016年 rodhos. All rights reserved.
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
