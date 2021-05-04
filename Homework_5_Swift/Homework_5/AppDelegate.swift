//
//  AppDelegate.swift
//  Homework_5
//
//  Created by Aleksandr Kan on 19.04.2021.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Task 1
        let man = Man(name: "Alex", height: 170.0, weight: 77.0, gender: .Man)
        let runner = Runner(name: "Dima", height: 176.0, weight: 66.0, gender: .Man)
        let swimmer = Swimmer(name: "Anna", height: 180.0, weight: 75, gender: .Woman)
        let cyclist = Cyclist(name: "Jack", height: 167.5, weight: 65, gender: .Man)
        let student = Student(name: "Vick", height: 180.0, weight: 73, gender: .Man, age: 22, status: "Study")
        
        
        
        let arraypeople = [man, runner, student, swimmer, cyclist]
        
        for person in arraypeople.reversed() {
            print("")
            print("Name: \(person.name)")
            print("Height: \(person.height)")
            print("Weight: \(person.weight)")
            print("Gender: \(person.gender)")
            person.move()
            
            if let man = person as? Student {
                print("")
                print("Name student: \(man.name)")
                print("Height: \(man.height)")
                print("Weight: \(man.weight)")
                print("Gender: \(man.gender)")
                print("Age: \(man.age)")
                print("Status: \(man.status)")
                man.move()
            }
            
        }
        
        
        //Task 2
        let animal = Animal(inType: .noType, animalType: .noType, inName: "No name Animal", inAge: 1,
                                  inArea: .afrika, inWeight: 1.0, inHeight: 2.0, inGender: .Woman)
        let falcon = Eagle(inType: .birds, animalType: .predator, inName: "Falcon", inAge: 2,
                            inArea: .alaska, inWeight: 23.1, inHeight: 2.8, inGender: .Men)
        let shark = Shark(inType: .fishes, animalType: .predator, inName: "White Shark", inAge: 5,
                                inArea: .asia, inWeight: 101.4, inHeight: 3.5, inGender: .Woman)
        let aligator = Crocodile(inType: .reptiles, animalType: .predator, inName: "Gena", inAge: 4,
                                  inArea: .afrika, inWeight: 100, inHeight: 250.8, inGender: .Men)
        
        let animalsArray = [falcon, animal, shark, aligator]
       // let peopleAndAnimals: [AnyObject] = arraypeople + animalsArray
        
        let mixArray: [AnyObject] = [aligator, man, falcon, runner, shark, swimmer, animal, cyclist, student]
        var count = 0
        
        for object in mixArray {
            
            count += 1
            
            if let man = object as? Man {
                print("")
                print("Object \(count) type man")
                print("Name man: \(man.name)")
                print("Age man: \(man.weight)")
            } else if let animal = object as? Animal {
                print("")
                print("Object \(count) type animal")
                print("Name animal: \(animal.name)")
                print("Area live: \(animal.areaLive)")
            }
            
        }
        
        
        //Task 3
        print("")
        print("Task 3")
        
        let countArray = arraypeople.count + animalsArray.count
       
        for i in 0... {
            
            guard i < countArray else {
                break
            }
            
            if i < arraypeople.count {
                print("")
                print("Name man: \(arraypeople[i].name)")
                print("gender man: \(arraypeople[i].gender)")
                arraypeople[i].move()
            }
            
            if i < animalsArray.count {
                print("")
                print("Animal type: \(animalsArray[i].typeAnimal)")
                print("Animal name: \(animalsArray[i].name)")
                animalsArray[i].moveForAnimal()
            }
        }
        
        
        //Task superman
       let sortedArray = mixArray.sorted(by:) {
        if let x = $0 as? Man, let y = $1 as? Man {
            //let x = $0 as! Man
            //let y = $1 as! Man
            return x.name < y.name
        } else if $0 is Animal && $1 is Animal {
            return false
        } else {
            return true
        }
    }
        
        
        for i in sortedArray {
            if let man = i as? Man {
                
                print("Human \(man.name)")
            }
            
            if let animal = i as? Animal {
                print("Animal \(animal.name)")
            }
            
           
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

