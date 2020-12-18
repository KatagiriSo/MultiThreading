//
//  StateSaver.swift
//  Balking
//
//  Created by KatagiriSo on 2016/10/14.
//  Copyright © 2016年 rodhos soft. All rights reserved.
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
