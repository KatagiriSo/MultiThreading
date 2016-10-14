//
//  StateSaver.swift
//  Balking
//
//  Created by 片桐奏羽 on 2016/10/14.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class StateSaver {
    let state:CurrentState
    
    init(state:CurrentState) {
        self.state = state
    }
    
    public func run() {
        while true {
            state.save()
            Thread.sleep(forTimeInterval: TimeInterval(2.0))
        }
    }
}
