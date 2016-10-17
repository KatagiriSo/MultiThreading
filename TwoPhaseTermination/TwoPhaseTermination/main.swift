//
//  main.swift
//  TwoPhaseTermination
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
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
