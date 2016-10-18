//
//  CommandRequest.swift
//  ActiveObject
//
//  Created by 片桐奏羽 on 2016/10/18.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class CommandRequest : Request<String> {
    
    let command:Int
    
    public init(exe:ActiveObjectExe, future:FutureResult<String>, command:Int) {
        self.command = command
        super.init(exe: exe, future: future)
    }
    
    public override func execute() {
        let result:Result<String> = exe.request(command: command)
        future?.setResult(result: result)
    }
}
