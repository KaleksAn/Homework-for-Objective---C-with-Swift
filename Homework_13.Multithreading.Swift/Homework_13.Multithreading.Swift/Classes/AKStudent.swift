//
//  AKStudent.swift
//  Homework_13.Multithreading.Swift
//
//  Created by Aleksandr Kan on 06.09.2021.
//

import Foundation
import UIKit


typealias MyBlock = (_ studentName: String, _ number: Int, _ time: CFTimeInterval) -> (Void)

class Student {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    //Аналог dispatch_once_t
    static let once: DispatchQueue = {
        return DispatchQueue.init(label: "com.alexKan.onceQueue", attributes: .concurrent)
    }()
    
    func findAnswer(answer: Int, range: ClosedRange<Int>) {
        var findNumber: Int?
        //let queue = DispatchQueue.init(label: "com.alexKan.queue_1") //attributes: .concurrent
        
        Student.once.async {
            let startTime = CACurrentMediaTime()
//            for number in range {
//                if number == answer {
//                    findNumber = Int(number)
//                    break
//                } else {
//                    continue
//                }
//            }
            
            
            while findNumber != answer {
                findNumber = Int( arc4random_uniform(UInt32(range.last ?? 0 + 1)))
            }
            
            DispatchQueue.main.async {
                print("Student \(self.name) was find answer number equal: \(findNumber ?? 0). Time for find: \(CACurrentMediaTime() - startTime)")
            }
        
        }
    }
    
    
    func findAnswer_2(answer: Int, range: ClosedRange<Int>,  block: @escaping MyBlock) {
        var findNumber: Int?
       // let queue = DispatchQueue.global(qos: .userInitiated)
        let queue = DispatchQueue.init(label: "com.alexKan.queue_1", attributes: .concurrent)
        
        queue.async {
            let timeStart = CACurrentMediaTime()
            
            for value in range {
                switch value {
                    case answer:
                        findNumber = value
                        break
                    default:
                        continue
                }
            }
            
            
                if let finallyNumber = findNumber {
                    DispatchQueue.main.async {
                    //print("Student \(self.name) was find answer number equal: \(finallyNumber). Time for find: \(CACurrentMediaTime() - timeStart)")
                    block(self.name, finallyNumber, CACurrentMediaTime() - timeStart)
                }
            }
            
        }
        
    }
    
    
    
    
}
