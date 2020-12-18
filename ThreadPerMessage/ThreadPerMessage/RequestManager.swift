//
//  RequestManager.swift
//  ThreadPerMessage
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class RequestManager {
    private let helper:Helper
    
    init (helper:Helper) {
        self.helper = helper
    }
    
    public func request(request:Request) {
        print("[begin]reqiest \(request)")
        DispatchQueue.global().async {
            self.helper.hundle(request:request)
        }
        print("[end]reqiest \(request)")
    }
}
