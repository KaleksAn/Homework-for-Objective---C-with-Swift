//
//  Animal.swift
//  Homework_5_Swift
//
//  Created by Aleksandr Kan on 21.04.2021.
//

import Foundation

class Animal {
    enum Class {
        case cats
        case reptiles
        case fishes
        case birds
        case noType
    }
    
    enum TypeAnimal {
        case predator
        case herbivorous
        case noType
    }
    
    enum Gender {
        case Men
        case Woman
        case noGender
    }
    
    enum Area {
        case asia
        case central_Asia
        case europe
        case afrika
        case alaska
        case noArea
    }
    
    
    var typeClass: Class
    var typeAnimal: TypeAnimal
    var name: String
    var age: Int
    var areaLive: Area
    var weight: Double
    var height: Double
    var gender: Gender
    
    
    init(inType: Class, animalType: TypeAnimal, inName: String, inAge: Int, inArea: Area, inWeight: Double, inHeight: Double, inGender: Gender) {
        
        self.typeClass = inType
        self.typeAnimal = animalType
        self.name = inName
        self.age = inAge
        self.areaLive = inArea
        self.weight = inWeight
        self.height = inHeight
        self.gender = inGender
        
    }
    
    func moveForAnimal() {
        print("Animal is MOVE!")
    }
    
}
