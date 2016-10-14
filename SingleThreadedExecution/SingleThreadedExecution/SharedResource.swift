//
//  SharedResource.swift
//  SingleThreadedExecution
//
//  Created by 片桐奏羽 on 2016/10/14.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class SharedResource {
    private var counter:Int = 0
    private var name:String = "Nobody"
    private var name2:String = "Nobody"
    
    // unsafe method
    public func pass(name:String) {
        objc_sync_enter(self)
        counter = counter + 1
        self.name = name
        self.name2 = name
        check()
        objc_sync_exit(self)
    }
    
    
    // unsafe method
    public func toString() -> String {
        let res:String
        objc_sync_enter(self)
        res = "NO." + "\(counter)" + ": " + name + ", " + name2
        objc_sync_exit(self)
        return res
    }
    
    // used by sync method
    private func check() {
        if name != name2 {
            print("[error] " + toString())
        }
    }
    
}
