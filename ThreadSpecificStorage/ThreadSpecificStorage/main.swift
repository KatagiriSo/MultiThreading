//
//  main.swift
//  ThreadSpecificStorage
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation


for i in 0...100 {
    let u = User(id: i)
    DispatchQueue.global().async {u.run()}
}

Thread.sleep(forTimeInterval: 1)

LogManager.allLog()


