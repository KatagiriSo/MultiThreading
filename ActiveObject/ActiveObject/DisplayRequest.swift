//
//  DisplayRequest.swift
//  ActiveObject
//
//  Created by 片桐奏羽 on 2016/10/18.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class DisplayRequest : Request<String> {
    internal let string:String
    public init(exe:ActiveObjectExe, string:String) {
        self.string = string
        super.init(exe: exe, future: nil)
    }
    
    public override func execute() {
        exe.display(string)
    }
}
