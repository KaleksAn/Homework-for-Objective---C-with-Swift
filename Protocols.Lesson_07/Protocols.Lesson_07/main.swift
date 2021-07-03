//
//  main.swift
//  Protocols.Lesson_07
//
//  Created by Aleksandr Kan on 03.07.2021.
//

import Foundation


let swimmer = Swimmer(name: "John", age: 23, speed: 22.3)
let runner = Runner(name: "Fred", age: 12, distance: 15.2)
let jumper = Jumper(name: "Dima", age: 27, maxHeight: 5.5)
let superMan = SuperMan(name: "Clark Kent", age: 19, height: 100.2, distance: 1000.0, speed: 2000.0)

let kangaroo = Kangaroo(name: "Steve", age: 1, height: 5.0)
let penguin = Penguin(name: "Nick", age: 3, speed: 67.7)
let tiger = Tiger(name: "Sherhan", age: 10, distance: 30.1)
let superAnimal = SuperAnimal(name: "Pokemon", age: 2, distance: 9999.0, speed: 9999.0, height: 9999.0)


let peopleAndAnimals: [AnyObject] = [kangaroo, swimmer, penguin, runner, tiger, jumper, superAnimal, superMan]
var humans: [Human] = [Human]()
var animals: [Animal] = [Animal]()

func checkProtocol(array: [AnyObject]) {
    for object in array {
        sortObjects(object: object)
        
        if let jumperMan = object as? Jumpers {
            print("Jumper \(jumperMan.name!)")
            print("Age: \(jumperMan.age!)")
            print("Max Height \(jumperMan.maxHeight)")
            jumperMan.jump()
            jumperMan.sleep?()
            print()
        }
        
        if let swimmerMan = object as? Swimmers {
            print("Swimmer \(swimmerMan.name!)")
            print("Age \(swimmerMan.age!)")
            print("Max Speed \(swimmerMan.maxSpeed)")
            swimmerMan.swim()
            swimmerMan.play?()
            print()
        }
        
        if let runnerMan = object as? Runners {
            print("Runner \(runnerMan.name!)")
            print("Age \(runnerMan.age!)")
            print("Max Distance \(runnerMan.maxDistance)")
            runnerMan.run()
            runnerMan.wash?()
            print()
        }
        
    }
}


func sortObjects(object: AnyObject) {
    if let man = object as? Human {
        humans.append(man)
    }
    
    if let animal = object as? Animal {
        animals.append(animal)
    }
}


checkProtocol(array: peopleAndAnimals)



print(humans.count)
print(animals.count)
