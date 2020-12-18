//
//  Stocker.swift
//  ProducerConsumer
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public protocol Stocker {
    func append(element:Product)
    func take()->Product
}

public class StockerList:Stocker {
    internal let max:Int
    internal var list:[Product] = []
    private let semaphore:DispatchSemaphore = DispatchSemaphore(value: 0)
    
    public init (max:Int) {
        self.max = max
    }
    
    public func append(element: Product) {
        objc_sync_enter(self)
        
        while list.count >= max {
            objc_sync_exit(self)
            print("append wait..")
            semaphore.wait()
            objc_sync_enter(self)
        }
        
        list.append(element)
        objc_sync_exit(self)
        
        let ret = semaphore.signal()
//        print("put signal \(ret)")
    }
    
    public func take()->Product {
        objc_sync_enter(self)
        while list.count == 0 {
            objc_sync_exit(self)
            print("take wait..")
            semaphore.wait()
            objc_sync_enter(self)
        }
        let r = list.first!
        list = list.dropFirst().map{(p:Product)->Product in p}
        objc_sync_exit(self)
        
        let ret = semaphore.signal()
//        print("take signal \(ret)")
        return r
    }
}
