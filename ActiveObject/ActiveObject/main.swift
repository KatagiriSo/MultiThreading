//
//  main.swift
//  ActiveObject
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

let activeObject = ActiveObjectFactory.createActiveObject()

let commandUser = CommandUser(name: "u1", activeObject: activeObject)
let commandUser2 = CommandUser(name: "u2", activeObject: activeObject)
let displayUser = DispUser(name: "u3", activeObject: activeObject)

DispatchQueue.global().async {commandUser.run()}
DispatchQueue.global().async {commandUser2.run()}
DispatchQueue.global().async {displayUser.run()}

while true {
    
}

