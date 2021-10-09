//
//  AppDelegate.swift
//  Homework_16.Date
//
//  Created by Aleksandr Kan on 09.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var startDate = Date(timeIntervalSince1970: 0)
    let endDate = Date(timeIntervalSinceNow: 0)


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let studentArray = AKStudent.createStudents(count: 30)
        printDiscribeStudents(students: studentArray)
        
        
        //MASTER LEVEL
      // let timer =  Timer(timeInterval: 0.5, target: self, selector: #selector(birthDayCongratulations(timer:)), userInfo: studentArray, repeats: true)
        Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(birthDayCongratulations(timer:)), userInfo: studentArray, repeats: true)
        
        //Разница в возрасте
        self.youngOld(students: studentArray)
        
        //SUPERMAN - разобран по чужому решению....
        //В будущем ещё вернусь. 
        
        
        return true
    }

    //MARK: My Methods
    
    //Print students
    
    func printDiscribeStudents(students list: [AKStudent]) {
        let array = sortArray(students: list)
        
        for student in array {
            print(student.description)
        }
        
    }
    
    //Sort array students with date birth
    
    func sortArray(students: [AKStudent]) -> [AKStudent] {
        
        let array = students.sorted { student1, student2 in
            if student1.dateBirth <= student2.dateBirth { return false } else
            if student1.dateBirth >= student2.dateBirth { return true } else {
                return true
            }
        }
        
        
        return array
    }
    
    //Day Birth
    
    @objc func birthDayCongratulations (timer: Timer) {
        let list = self.checkKindClass(array: timer.userInfo as! [Any?])
        let formatt = DateFormatter()
        formatt.dateStyle = .full
        formatt.locale = Locale.current
        formatt.timeZone = TimeZone.current
        
        for student in list {
            if formatt.string(from: student.dateBirth) == formatt.string(from: self.startDate) {
                print("Happy Birthday \(student.name) \(student.surname). Date birthday \(student.dateBirth)")
            }
        }
        
        self.startDate = self.startDate.addingTimeInterval(60 * 60 * 24)
        
        if self.startDate == self.endDate {
            timer.invalidate()
        }
    }
    
    //Check array for class AKStudent
    
    func checkKindClass(array: [Any?]) -> [AKStudent] {
        var emptyList = [AKStudent]()
        
        for man in array {
            if  man is AKStudent {
                emptyList.append(man as! AKStudent)
            }
        }
        
        return emptyList
    }
    
    //Younger and older
    
    func youngOld(students: [AKStudent]) {
        let youngStudent = sortArray(students: students).first
        let oldStudent = sortArray(students: students).last
        
        guard youngStudent != nil && oldStudent != nil else {
            return
        }
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: oldStudent!.dateBirth , to: youngStudent!.dateBirth)
        print("Difference between younger \(youngStudent!.name) and \(oldStudent!.dateBirth): days: \(components.day!), month: \( components.month!), year's: \(components.year!)")
        
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

