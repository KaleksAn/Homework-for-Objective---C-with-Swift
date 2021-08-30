//
//  Student.swift
//  Homework_12.Closers and Blocks
//
//  Created by Aleksandr Kan on 29.08.2021.
//

import Foundation

class Student {
    var name: String
    var surname: String
    var fullName: String {
        get {
            return name + " " + surname
        }
    }
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    
    
    deinit {
        print("STUDENT \(self.name) DEINIT")
    }
}




