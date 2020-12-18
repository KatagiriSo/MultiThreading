//
//  main.swift
//  ProducerConsumer
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

let stocker = StockerList(max:5)

let m0:Maker = Maker(name: "m0", stocker: stocker)
let m1:Maker = Maker(name: "m1", stocker: stocker)
let m2:Maker = Maker(name: "m2", stocker: stocker)
let m3:Maker = Maker(name: "m3", stocker: stocker)
let m4:Maker = Maker(name: "m4", stocker: stocker)

let u0:User = User(name: "u0", stocker: stocker)
let u1:User = User(name: "u1", stocker: stocker)
let u2:User = User(name: "u2", stocker: stocker)
let u3:User = User(name: "u3", stocker: stocker)
let u4:User = User(name: "u4", stocker: stocker)


DispatchQueue.global().async { u0.run() }
DispatchQueue.global().async { u1.run() }
DispatchQueue.global().async { u2.run() }
DispatchQueue.global().async { u3.run() }
DispatchQueue.global().async { u4.run() }

DispatchQueue.global().async { m0.run() }
DispatchQueue.global().async { m1.run() }
DispatchQueue.global().async { m2.run() }
DispatchQueue.global().async { m3.run() }
DispatchQueue.global().async { m4.run() }


while true {
    
}
