//
//  Class Animal.swift
//  Protocols.Lesson_07
//
//  Created by Aleksandr Kan on 03.07.2021.
//  Copyright © 2021 AK. All rights reserved.
//

import Foundation


class Animal {
   @objc var name: String
   @objc var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


class Kangaroo: Animal, Jumpers {
    var maxHeight: Double
    
    init(name: String, age: Int, height: Double) {
        self.maxHeight = height
        super.init(name: name, age: age)
    }
    
    func jump() {
        print(" Kangaroo \(self.name) JUMP!")
    }
}


class Penguin: Animal, Swimmers {
    var maxSpeed: Double
    
    init(name: String, age: Int, speed: Double) {
        self.maxSpeed = speed
        super.init(name: name, age: age)
    }
    
    func swim() {
        print("Penguin \(self.name) SWIM!")
    }
    
    //optional
    
    func play() {
        print("Animal \(self.name) play and swim")
    }
}



class Tiger: Animal, Runners {
    var maxDistance: Double
    
    init(name: String, age: Int, distance: Double) {
        maxDistance = distance
        super.init(name: name, age: age)
    }
    
    func run() {
        print("Tiger \(self.name) RUN to HOME!")
    }
    
    //optional
    
    func wash() {
        print("\(self.name) WASH")
    }
    
}


class SuperAnimal: Animal, Jumpers, Swimmers, Runners {
    var maxDistance: Double
    var maxSpeed: Double
    var maxHeight: Double
    
    init(name: String, age: Int, distance: Double, speed: Double, height: Double) {
        maxDistance = distance
        maxSpeed = speed
        maxHeight = height
        super.init(name: name, age: age)
    }
    
    func jump() {
        print("SuperAnimal Jump!")
    }
    
    func swim() {
        print("SuperAnimal Swim!")
    }
    
    func run() {
        print("SuperAnimal RUN!")
    }
}
