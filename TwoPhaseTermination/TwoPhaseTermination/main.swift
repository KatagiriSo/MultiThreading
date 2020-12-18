//
//  main.swift
//  TwoPhaseTermination
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

let counter = Couner()

DispatchQueue.global().async {
    counter.run()
}

Thread.sleep(forTimeInterval: 3.0)

print("cancel")
counter.doCancel()


while(true) {
    
}
