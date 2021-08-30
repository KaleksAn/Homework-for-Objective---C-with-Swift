//
//  Human.swift
//  Homework_12.Closers and Blocks
//
//  Created by Aleksandr Kan on 30.08.2021.
//

import Foundation

class Human {
    var name: String
    var age: Int
    var humanBlock: (() -> Void)?
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        //self.humanBlock = block
        weak var link = self // слабая ссылка на объект
        //Аналог указателя в obj - c. __weak AKTestClass* link = self
        
        self.humanBlock = {
            if link!.age > 6 {
                print("Human \(link!.name) school boy.")
            } else if link!.age >= 17 {
                print("Human \(link!.name) student.")
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            print("Call dispatch method after 5 seconds")
        }
        
    }
    
    
    func blockTest(block: () -> Void) {
        let boolVar = true
        
        if boolVar {
            block()
        }
        
    }
    
    
    deinit {
        print("Human \(self.name) DEINITIALIZED!!!")
    }
}




