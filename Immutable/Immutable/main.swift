//
//  main.swift
//  Immutable
//
//  Created by KatagiriSo on 2016/10/14.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

let user = User(name:"U", age:10)

DispatchQueue.global().async {
    while true {
        print("1 -" + user.toString())
    }
}

DispatchQueue.global().async {
    while true {
        print("2 -" + user.toString())
    }
}

DispatchQueue.global().async {
    while true {
        print("3 -" + user.toString())
    }
}

while true {
    
}
