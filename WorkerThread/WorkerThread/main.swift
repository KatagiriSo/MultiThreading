//
//  main.swift
//  WorkerThread
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

let m = CommandManager(workerNumber: 5)
m.start()

let u0 = User(name: "u0", commandManager: m)
let u1 = User(name: "u1", commandManager: m)
let u2 = User(name: "u2", commandManager: m)

DispatchQueue.global().async {u0.run()}
DispatchQueue.global().async {u1.run()}
DispatchQueue.global().async {u2.run()}

while true {
    
}
