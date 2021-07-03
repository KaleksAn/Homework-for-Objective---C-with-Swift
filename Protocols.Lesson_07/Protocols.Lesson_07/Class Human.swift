//
//  Class Human.swift
//  Protocols.Lesson_07
//
//  Created by Aleksandr Kan on 03.07.2021.
//  Copyright © 2021 AK. All rights reserved.
//

import Foundation


class Human {
    @objc var name: String
    @objc var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


class Jumper: Human, Jumpers {
    var maxHeight: Double
    
    init(name: String, age: Int, maxHeight: Double) {
        self.maxHeight = maxHeight
        super.init(name: name, age: age)
    }
    
    func jump() {
        print("Jumper \(self.name) to JUMP!")
    }
    
    //optional
    func sleep() {
        print("Jumper \(self.name) SLEEP...")
    }
    
}


class Swimmer: Human, Swimmers {
    var maxSpeed: Double
    
    init(name: String, age: Int, speed: Double) {
        maxSpeed = speed
        super.init(name: name, age: age)
    }
    
    func swim() {
        print("Swimmer \(self.name) to SWIM!")
    }
    
    //optional
    func play() {
        print("Swimmer \(self.name) PLAY on PS5")
    }
    
}



class Runner: Human, Runners {
    var maxDistance: Double
    
    init(name: String, age: Int, distance: Double) {
        maxDistance = distance
        super.init(name: name, age: age)
    }
    
    func run() {
        print("Runner \(self.name) tto RUN!!!")
    }
    
    //optional
    func wash() {
        print("Runner \(self.name) WASH")
    }
    
}



class SuperMan: Human, Jumpers, Swimmers, Runners {
    var maxHeight: Double
    var maxDistance: Double
    var maxSpeed: Double
    
    init(name: String, age: Int, height: Double, distance: Double, speed: Double) {
        maxHeight = height
        maxDistance = distance
        maxSpeed = speed
        super.init(name: name, age: age)
        
    }
    
    func jump() {
        print("SUPERMAN \(self.name) to JUMP")
    }
    
    func swim() {
        print("SUPERMAN \(self.name) to SWIM")
    }
    
    func run() {
        print("SUPERMAN \(self.name) to RUN")
    }
    
    
    //optional
    func sleep() {
        print("SUPERMAN SLEEP!")
    }
    
}
