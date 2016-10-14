//
//  CurerntState.swift
//  Balking
//
//  Created by 片桐奏羽 on 2016/10/14.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class CurrentState {
    internal var saveState:String?
    internal var state:String
    internal var changed:Bool
    
    init(state:String) {
        self.state = state
        changed = true
    }
    
    public func changeState(state:String) {
        objc_sync_enter(self)

        print("changeState \(state)")

        self.state = state
        changed = true
        
        objc_sync_exit(self)
    }
    
    public func save() {
        
        // guard condition
        guard changed else {
            print("balking")
            return
        }
        
        objc_sync_enter(self)
        doSave()
        changed = false
        objc_sync_exit(self)

    }
    
    internal func doSave() {
        print("save.. \(state)")
        assert(saveState != state, "[Error]")
        saveState = state
    }
}
