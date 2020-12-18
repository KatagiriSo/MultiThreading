//
//  main.swift
//  GuardedSuspension
//
//  Created by KatagiriSo on 2016/10/14.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

let stocker = CommandStocker()
let user = User(stocker: stocker, name: "user0")
let server = CommandServer(stocker: stocker)

DispatchQueue.global().async {
    user.run()
}

DispatchQueue.global().async {
    server.run()
}

while true {
    
}
