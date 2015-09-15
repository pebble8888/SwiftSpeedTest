//
//  main.swift
//  SwiftSpeedTest
//
//  Created by pebble8888 on 2015/09/15.
//  Copyright © 2015年 pebble8888. All rights reserved.
//

import Foundation


// MARK: メソッド呼び出し

class SwiftClass {
    func method() {
    }
}

struct MTSwift: SpeedTest {
    let obj = SwiftClass()
    
    func main() {
        obj.method()
    }
}

struct MTObjC: SpeedTest {
    let obj = ObjCClass()
    
    func main() {
        obj.method()
    }
}

// MARK: メソッド呼び出し
let defaultCnt = 1000000
MTSwift().start(defaultCnt)
MTObjC().start(defaultCnt)
