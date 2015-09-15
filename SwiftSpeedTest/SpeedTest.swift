//
//  SpeedTest.swift
//  SwiftSpeedTest
//
//  Created by pebble8888 on 2015/09/15.
//  Copyright © 2015年 pebble8888. All rights reserved.
//

import Foundation


// MARK: SpeedTest Protocol

protocol SpeedTest {
    func setup()
    func main()
}

extension SpeedTest {
    
    func setup() {
    }
    
    func start(repeats: Int, function: String = __FUNCTION__, file: String = __FILE__, line: Int = __LINE__) {
        var total: Double = 0
        var name = _stdlib_getDemangledTypeName(self)
        if let range = name.rangeOfString(".") {
            name = name.substringFromIndex(range.endIndex)
        }
        
        print(name)
        print("-".times(20))
        
        // 5回リピート
        for _ in 0..<5 {
            setup()
            let start = NSDate()
            
            autoreleasepool {
                for _ in 0..<repeats {
                    main()
                }
            }
            
            let e = NSDate().timeIntervalSinceDate(start) as Double
            print(String(format: "%.3f", e))
            total += e
        }
        
        let avg = String(format: "%.3f", total / 5)
        print("-".times(20))
        print("Avg: \(avg)")
        print("=".times(20))
        
    }
}

extension String {
    func times(num: Int) -> String {
        var res = ""
        for _ in 0..<num {
            res += self
        }
        return res
    }
}
