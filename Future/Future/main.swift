//
//  main.swift
//  Future
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

let m = RequestManager()

print("request")

let r0 = m.request(command: 0)
let r1 = m.request(command: 1)
let r2 = m.request(command: 2)
let r3 = m.request(command: 3)

print("other job")
Thread.sleep(forTimeInterval: 2.0)

print("r0 == \(r0.getResult())")
print("r1 == \(r1.getResult())")
print("r2 == \(r2.getResult())")
print("r3 == \(r3.getResult())")


