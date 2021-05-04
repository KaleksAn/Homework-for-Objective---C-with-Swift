//
//  Man.swift
//  Homework_5
//
//  Created by Aleksandr Kan on 19.04.2021.
//

import Foundation

class Man {
    var name: String;
    var height: Double;
    var weight: Double;
    var gender: Gender;
    
    enum Gender {
        case Man;
        case Woman;
    }
    
    
    init(name: String, height: Double, weight: Double, gender: Gender) {
        self.name = name
        self.height = height
        self.weight = weight
        self.gender = gender
    }
        
    func move() {
        print("Man is MOVE!")
    }
    
    
}
