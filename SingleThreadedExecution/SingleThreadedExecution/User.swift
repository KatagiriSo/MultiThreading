//
//  User.swift
//  SingleThreadedExecution
//
//  Created by 片桐奏羽 on 2016/10/14.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class User {
    private let sharedResource:SharedResource
    private let name:String
    
    init(sharedResource:SharedResource, name:String) {
        self.sharedResource = sharedResource
        self.name = name
    }
    
    public func pass() {
        print(name + " Begin")
        while true {
            sharedResource.pass(name: name)
        }
    }
}
