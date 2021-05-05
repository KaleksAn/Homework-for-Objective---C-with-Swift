//
//  AppDelegate.swift
//  Lesson_08.Dictionary
//
//  Created by Aleksandr Kan on 04.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Task 1 - 2
        let student_1 = Student(name: "Alex", surname: "Kan", phrase: "Hi friend!")
        let student_2 = Student(name: "Boris", surname: "Sergeev", phrase: "Bye")
        let student_3 = Student(name: "Oleg", surname: "Fedotov", phrase: "Old man")
        let student_4 = Student(name: "Vasiliy", surname: "Lomachenko", phrase: "I am a champion")
        let student_5 = Student(name: "Vladimir", surname: "Mihaylov", phrase: "Good morning")
        let student_6 = Student(name: "Nikolay", surname: "Petrov", phrase: "I buy this  gift")
        
        //Task 3 - 4
        let studentJournal = [student_1.key() : student_1,
                              student_2.key() : student_2,
                              student_3.key() : student_3,
                              student_4.key() : student_4,
                              student_5.key() : student_5,
                              student_6.key() : student_6]
        
    var count = 1
    var arrayKeys = [String]()
        
        for key in studentJournal.keys {
            if let student = studentJournal[key] {
                print("\(count).Student: \(student.surname) \(student.name)")
                print("Phrase: \(student.phrase)")
                print()
                arrayKeys.append(key)
            }
            count += 1
        }
        
        
        
        //Task 5
        print("-----------------------------------")
        
      let sortedArray = arrayKeys.sorted(by:) {(key1, key2) in
            if key1 < key2 {
                return true
            } else if key1 > key2 {
                return false
            } else {
                return false
            }
            
        }
        
        
        for key in sortedArray {
            if let student = studentJournal[key] {
                print("Student: \(student.fullName)")
                print("Phrase: \(student.phrase)")
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

