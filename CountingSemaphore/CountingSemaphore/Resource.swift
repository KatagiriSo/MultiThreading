//
//  Resource.swift
//  CountingSemaphore
//
//  Created by 片桐奏羽 on 2016/10/14.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public class Resouce {
    private let maxUser:Int
    private let semaphore:DispatchSemaphore
    
    init(maxUser:Int) {
        self.maxUser = maxUser
        self.semaphore = DispatchSemaphore(value: maxUser)
    }
    
    public func use(user:User) throws {
        let result:DispatchTimeoutResult = semaphore.wait(timeout: DispatchTime(uptimeNanoseconds: 1000*1000*1))
        
        switch result {
        case .success:
            doUse(user:user)
            print("\(user.name) signal ")
            semaphore.signal()
        case .timedOut:
            print("\(user.name) timedOut ")
        }
    }
    
    internal func doUse(user:User) {
        let time:Double = Double((arc4random()%2000))/1000
        print("[Begin]\(user.name) use Resource time(\(time))")
        Thread.sleep(forTimeInterval: TimeInterval(time))
        print("[End]\(user.name) Resource use ")
    }
    
    
}
