//
//  User.swift
//  Balking
//
//  Created by KatagiriSo on 2016/10/14.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class User {
    internal let state:CurrentState
    
    init (state:CurrentState) {
        self.state = state
    }
    
    public func run() {
        var i:Int = 0
        while true {
            state.changeState(state: "\(i)")
            Thread.sleep(forTimeInterval: TimeInterval(1.0))
            state.save()
            i = i + 1
        }
    }
}
