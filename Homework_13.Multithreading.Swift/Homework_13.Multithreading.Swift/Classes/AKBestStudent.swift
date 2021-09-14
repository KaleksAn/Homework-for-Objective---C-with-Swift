//
//  AKBestStudent.swift
//  Homework_13.Multithreading.Swift
//
//  Created by Aleksandr Kan on 10.09.2021.
//

import Foundation
import UIKit

typealias Block = (_ value: Int, _ name: String, _ time: Double) -> Void

class BestStudent {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    
    func findNumber(answer: Int, range: ClosedRange<Int>, block: Block?) {
        var number = 0
        
        let queue = OperationQueue()
        queue.name = "com.alexKan.queue1"
        
        let mainQueue = OperationQueue.main
        mainQueue.name = "com.alxKan.operationQueue"
        
        queue.maxConcurrentOperationCount = 1
        
        
        queue.addOperation {
            let startTime = CACurrentMediaTime()
            print("Queue \(String(describing: queue.name))")
            
            while number != answer {
                number += 1
            }
            
                mainQueue.addOperation { [weak self] in
                    print("Queue \(String(describing: mainQueue.name))")
                    
                    guard let weakSelf = self else {
                        return
                    }
                    
                    block!(number, weakSelf.name, CACurrentMediaTime() - startTime)
                    
                }
            
            
        }
        
        
    }
    
}
