//
//  AKStudent.swift
//  Lesson_08.Dictionary
//
//  Created by Aleksandr Kan on 04.05.2021.
//

import Foundation

class Student {
    var name: String
    var surname: String
    var phrase: String
    
    init(name: String, surname: String, phrase: String) {
        self.name = name
        self.surname = surname
        self.phrase = phrase
    }
    
    func key() -> String {
        return "\(self.surname) \(self.name)"
    }
    
}
