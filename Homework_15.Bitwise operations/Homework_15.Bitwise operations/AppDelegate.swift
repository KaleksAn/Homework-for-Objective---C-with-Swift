//
//  AppDelegate.swift
//  Homework_15.Bitwise operations
//
//  Created by Aleksandr Kan on 23.09.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        var studentList = [Student]()
        var listTechnical = [Student]()
        var listHumanitarian = [Student]()
        
        
        
        for i in 1...20 {
            let student = Student(name: "Student_\(i)", lessons: UInt8(arc4random() % 256) ) //UInt8(arc4random() % 129)
            studentList.append(student)
        }
        
        print("Print RESULT")
        print("")
        for student in studentList {
            print("\(student.name) \(student.description)")
            print("")
        }
        
        
        for student in studentList {
        
            if student.technicalLessons >= student.humanitarianLessons {
                listTechnical.append(student)
            } else if student.humanitarianLessons > student.technicalLessons {
                listHumanitarian.append(student)
            }
        }
       
        print("Count developers \(Student.countDevelopers)")
        print("Technical \(listTechnical.count)")
        print("Humanitarian \(listHumanitarian.count)")
        
        for student in studentList {
            print("")
            print("\(student.name)")
            print("Description \(student.description)")
            
        }
        
        
        
        //TASK SUPERMAN
        
        let randomNumber = arc4random() % UInt32.max
        
        print("Convert number \(randomNumber) to \(self.convertBynary(number: randomNumber))")
        
        
        
        
        return true
    }
    
    
    //MARK: - My Methods
    
    func convertBynary(number: UInt32) -> String {
        var result = ""
        var value = number
        
        while (true) {
            let zeroOrOne = value % 2
            result.insert(Character("\(zeroOrOne)"), at: result.startIndex)
            value = value >> 1
            
            if value == 0 {
                break
            }
            
        }
        
        return result
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

