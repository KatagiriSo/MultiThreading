//
//  Result.swift
//  ActiveObject
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class Result<T> {
    public func getResult()->T {
        assert(false, "abstract function") as! T
    }
}






