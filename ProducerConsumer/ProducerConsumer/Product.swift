//
//  Product.swift
//  ProducerConsumer
//
//  Created by 片桐奏羽 on 2016/10/17.
//  Copyright © 2016年 rodhos. All rights reserved.
//

import Foundation

public struct Product {
    public let id:Int
    public let madeBy:String
    
    public func description()->String {
        return "\(id) made by \(madeBy)"
    }
}
