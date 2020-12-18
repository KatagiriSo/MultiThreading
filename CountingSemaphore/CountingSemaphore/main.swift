//
//  main.swift
//  CountingSemaphore
//
//  Created by KatagiriSo on 2016/10/14.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

let resource:Resouce = Resouce(maxUser: 3)

for i in 0..<10 {
    let user = User(resource:resource, name:"user\(i)")
    DispatchQueue.global().async {user.run()}

}

while true {
    
}


