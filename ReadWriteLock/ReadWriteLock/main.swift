//
//  main.swift
//  ReadWriteLock
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

let stocker = RecordStocker()

let updater = RecordUpdater(stocker: stocker)
let u0 = User(stocker: stocker, name: "u0")
let u1 = User(stocker: stocker, name: "u1")
let u2 = User(stocker: stocker, name: "u2")
let u3 = User(stocker: stocker, name: "u3")
let u4 = User(stocker: stocker, name: "u4")

DispatchQueue.global().async { updater.run() }

DispatchQueue.global().async { u0.run() }
DispatchQueue.global().async { u1.run() }
DispatchQueue.global().async { u2.run() }
DispatchQueue.global().async { u3.run() }
DispatchQueue.global().async { u4.run() }

while true {
    
}
