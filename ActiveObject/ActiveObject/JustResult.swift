//
//  JustResult.swift
//  ActiveObject
//
//  Created by KatagiriSo on 2016/10/18.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

class JustResult<T> : Result<T> {
    private let resultValue:T
    init(_ resultValue:T) {
        self.resultValue = resultValue
    }
    
    public override func getResult() -> T {
        return resultValue
    }
}
