//
//  AppDelegate.swift
//  Homework_13.Multithreading.Swift
//
//  Created by Aleksandr Kan on 06.09.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var studentList = [Student]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //Create students and add on array
        for number in 1...10 {
            let student = Student(name: "Student \(number)")
            self.studentList.append(student)
        }
        
        //Test for method 1
        for student in self.studentList {
            let randomAnswer = Int(arc4random() % 101)
            student.findAnswer(answer: randomAnswer, range: 0...100)
        }
        
        
        //Test for method 2
        print("\nMETHOD #2")
        print("")
        for student in self.studentList {
            let randomAnswer = Int(arc4random() % 1000001)
            student.findAnswer_2(answer: randomAnswer, range: 0...1000000) { (studentName: String, number: Int, time: CFTimeInterval) in
                print("Student \(studentName) was find answer number equal: \(number). Time for find: \(time)")
            }
        }
        
        
        
        //SUPERMAN
        print("SUPERMAN")
        let bestStudent = BestStudent(name: "Dimka Kim")
        bestStudent.findNumber(answer: 16, range: 0...20) { number, name, time in
            print("Student \(name) find number \(number). Time for find - \(time)")
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

