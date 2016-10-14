//
//  main.swift
//  SingleThreadedExecution
//
//  Created by 片桐奏羽 on 2016/10/14.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

print("Testing")

let r:SharedResource = SharedResource()
let a = User(sharedResource: r, name: "A")
let b = User(sharedResource: r, name: "B")
let c = User(sharedResource: r, name: "C")

let queue:DispatchQueue = DispatchQueue.global()

queue.async {
    a.pass()
}

queue.async {
    b.pass()
}

queue.async {
    c.pass()
}

while(true) {
    
}
