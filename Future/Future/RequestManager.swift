//
//  RequestManager.swift
//  Future
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class RequestManager {
    public func request(command:Int) -> Future {
        
        let future = Future()
        
        DispatchQueue.global().async {
            let result = Result(command)
            future.setResult(result:result)
        }
        
        return future
    }
}
