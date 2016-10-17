//
//  main.swift
//  ThreadPerMessage
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

let helper = Helper()
let m = RequestManager(helper: helper)

print("[start] request")
m.request(request: .work(0))
m.request(request: .work(1))
m.request(request: .work(2))
m.request(request: .work(3))
m.request(request: .work(4))
m.request(request: .work(5))
m.request(request: .work(6))
print("[end] request")


while true {
    
}
