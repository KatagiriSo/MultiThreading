//
//  main.swift
//  Balking
//
//  Created by KatagiriSo on 2016/10/14.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

let state = CurrentState(state: "")
let stateSaver = StateSaver(state:state)
let user = User(state: state)

DispatchQueue.global().async {
    stateSaver.run()
}

DispatchQueue.global().async {
    user.run()
}

while true {
    
}

