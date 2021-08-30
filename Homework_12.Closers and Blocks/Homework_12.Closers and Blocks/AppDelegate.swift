//
//  AppDelegate.swift
//  Homework_12.Closers and Blocks
//
//  Created by Aleksandr Kan on 29.08.2021.
//

import UIKit
import Foundation

typealias NewTypeBlock_1 = () -> Void
typealias NewTypeBlock_2 = (_ x: Int, _ c: Int, _ s1: String) -> String
typealias NewTypeBlock_3 = (String, Int, String) -> Void
typealias PatientBlock = (Patient) -> Void


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var patientArray: [Patient] = []
    
     var myBlock: PatientBlock = {
        
        if $0.temperature > 36.6 && $0.temperature < 38.0 {
            $0.takePill()
        } else if $0.temperature >= 38.0 {
            $0.makeShot()
        } else if $0.temperature < 36.0 {
            print("Patient \($0.name) should rest.")
        } else if $0.temperature == 36.6 {
            print("Patient \($0.name) have good temperature!")
        }
    }
    
    var arr: [(String, Int, String) -> Void] = []
    
    var blockTestt: NewTypeBlock_1 = {}

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Level 1
        let firstBlock = { print("First block on Swift") }
        firstBlock()
        
        let secondBlock = { (str: String) -> Void in
            print("Second block on Swift. Input string: \(str)") }
        secondBlock("Test string")
        
        
        self.funcForBlock1 {
            print("This is first function with Block.")
        }
        
        self.funcForBlock2(num1: 23, num2: 31, str: "I love Apple:)") { num1, num2, str in
            return "Block result: \(num1), \(num2), \(str)"
        }
        
        
        
        
        self.funcForBlock3(str1: "KIA", num1: 776, str2: "HONDA") {
            print("TESTING BLOCK 3: \($0) \($1) \($2)")
        }
        
        let x = arr[0]
        x("TEST", 3, "LOL")
        
        
        //STUDENT LEVEL
        print("")
        print("STUDENT LEVEL")
        
        let student_1 = Student(name: "Alex", surname: "Kim")
        let student_2 = Student(name: "Alex", surname: "Kan")
        let student_3 = Student(name: "Dima", surname: "Kim")
        let student_4 = Student(name: "Vova", surname: "Ten")
        let student_5 = Student(name: "Artur", surname: "Pak")
        let student_6 = Student(name: "Robert", surname: "Ten")
        let student_7 = Student(name: "Sergey", surname: "Tegay")
        let student_8 = Student(name: "Slava", surname: "Lem")
        let student_9 = Student(name: "Karina", surname: "Kim")
        let student_10 = Student(name: "Alina", surname: "Nogay")
        
        
        let studentsList = [student_1, student_2,
                            student_3, student_4,
                            student_5, student_6,
                            student_7, student_8,
                            student_9, student_10]
        
        let newSortList = studentsList.sorted {
            if $0.name < $1.name {
                return true
            } else if $0.surname < $1.surname {
                return true
            } else {
                return false
            }
        }

        
        for student in newSortList {
            print("Student: \(student.fullName)")
        }
        
        
        //MASTER LEVEL
        print("")
        print("MASTER LEVEL")
        
        let patient_1 = Patient(name: "Pasha", block1: self.myBlock)
        let patient_2 = Patient(name: "Masha", block1: self.myBlock)
        let patient_3 = Patient(name: "Jack", block1: self.myBlock)
        let patient_4 = Patient(name: "Tom", block1: self.myBlock)
        let patient_5 = Patient(name: "Vitya", block1: self.myBlock)
        let patient_6 = Patient(name: "Slava", block1: self.myBlock)
        let patient_7 = Patient(name: "Borya", block1: self.myBlock)
        let patient_8 = Patient(name: "Denis", block1: self.myBlock)
        let patient_9 = Patient(name: "Misha", block1: self.myBlock)
        let patient_10 = Patient(name: "Dasha", block1: self.myBlock)
        
        
//        self.patientArray = [patient_1, patient_2,
//                           patient_3, patient_4,
//                           patient_5, patient_6,
//                           patient_7, patient_8,
//                           patient_9, patient_10]
        
//        for human in self.patientArray {
//            //human.youOk(block: self.myBlock)
//        }
//        
        
        
        
        //TEST
        
        let human_1 = Human(name: "Sam", age: 7)
        let human_2 = Human(name: "Jack", age: 18)
        let human_3 = Human(name: "Max", age: 8)

        human_1.blockTest(block: human_1.humanBlock!)
        human_2.blockTest(block: human_2.humanBlock!)
        human_3.blockTest(block: human_3.humanBlock!)

        let student_44 = Student(name: "TEST", surname: "ALFA")
        
        
        self.blockTestt = {
            print("NAME: \(student_44.fullName)")

        }
        self.blockTestt()
        
        
        
        
        
        return true
    }
    
    //MARK:  MyMethods for Blocks
    
    @objc func funcForBlock1(block: NewTypeBlock_1) {
        block()
    }
    
    func funcForBlock2(num1: Int, num2: Int, str:String, block: NewTypeBlock_2) {
       let outString = block(num1, num2, str)
       print("Result OUT string: \(outString)")
        
    }
    
    func funcForBlock3(str1: String, num1: Int, str2:String, block:@escaping NewTypeBlock_3) {
        arr.append(block)
        block("VER", 2, "STD")
    }
    
    
    @objc func test() {
        print("Hola")
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

