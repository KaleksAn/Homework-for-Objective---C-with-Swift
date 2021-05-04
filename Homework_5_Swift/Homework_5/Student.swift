//
//  Student.swift
//  Homework_5_Swift
//
//  Created by Aleksandr Kan on 20.04.2021.
//

import Foundation

class Student : Man {
    var age: Int = 0
    var status: String

    
    init(name: String, height: Double, weight: Double, gender: Gender, age: Int, status: String) {
        self.age = age
        self.status = status
    super.init(name: name, height: height, weight: weight, gender: gender)
    }
    
    override func move() {
        print("Super method from parent: \(super .move())")
        print("Method for STUDENT!")
    }
    

    
}
