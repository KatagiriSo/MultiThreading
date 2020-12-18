//
//  Couner.swift
//  TwoPhaseTermination
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class Couner {
    private var cancel:Bool = false
    private var count:Int = 0
    
    public func doCancel() {
        self.cancel = true
    }
    
    public func run() {
        while !cancel {
            countUp()
        }
        
        doShutDown()
    }
    
    private func countUp() {
        count = count + 1
        print("count \(count)")
    }
    
    private func doShutDown() {
        while count > 0 {
            count = count - 1
            print("shutDown count \(count)")
        }
    }
}
