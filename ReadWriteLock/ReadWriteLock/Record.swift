//
//  Record.swift
//  ReadWriteLock
//
//  Created by KatagiriSo on 2016/10/17.
//  Copyright © 2016年 rodhos soft. All rights reserved.
//

import Foundation

public class Record {
    public let uid:Int
    public let title:String
    
    init (uid:Int) {
        self.uid = uid
        self.title = "title \(uid)"
    }
}
