//
//  ActiveObject.swift
//  ActiveObject
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public protocol ActiveObject {
    
    func request(command:Int)->Result<String> // work 1
    func display(_ s:String) // work 2
}



public class ActiveObjectFactory {
    public static func createActiveObject()->ActiveObject {
        
        let exe:ActiveObjectExe = ActiveObjectExe()
        
        let queue:ActiveQueue = ActiveQueue<String>()
        let scheduler:Scheduler = Scheduler<String>(queue: queue)
        let proxy:ActiveObjectProxy = ActiveObjectProxy(exe: exe, scheduler: scheduler)
        DispatchQueue.global().async {
            scheduler.run()
        }
        return proxy
    }
}
