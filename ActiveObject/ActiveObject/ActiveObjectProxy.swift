//
//  ActiveObjectProxy.swift
//  ActiveObject
//
//  Created by KatagiriSo on 2016/10/18.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

class ActiveObjectProxy:ActiveObject {
    typealias S = String
    
    let exe:ActiveObjectExe
    let scheduler:Scheduler<S>
    
    public init(exe:ActiveObjectExe, scheduler:Scheduler<S>) {
        self.exe = exe
        self.scheduler = scheduler
    }
    
    func request(command: Int) -> Result<String> {
        let future  = FutureResult<String>()
        let request = CommandRequest(exe: exe, future: future, command: command)
        scheduler.invoke(request: request)
        return future
    }
    
    func display(_ s: String) {
        let request = DisplayRequest(exe: exe, string: s)
        scheduler.invoke(request: request)
    }
}
