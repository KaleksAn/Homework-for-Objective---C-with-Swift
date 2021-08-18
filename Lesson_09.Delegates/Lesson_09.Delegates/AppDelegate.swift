//
//  AppDelegate.swift
//  Lesson_09.Delegates
//
//  Created by Aleksandr Kan on 18.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let doctor = AKDoctor(name: "Dr. House")
        let badDoctor = BadDoctor(name: "Dr. Fred")
        
        let patient_1 = AKPatient(name: "Dima", surname: "Kim", age: 27, temperature: 36.0, pain: .foot, doctor: badDoctor, like: randomBool())
        let patient_2 = AKPatient(name: "Sasha", surname: "Pak", age: 22, temperature: 37.5, pain: .hand, doctor: doctor, like: randomBool())
        let patient_3 = AKPatient(name: "Kristina", surname: "Yun", age: 25, temperature: 36.6, pain: .tooth, doctor: doctor, like: randomBool())
        let patient_4 = AKPatient(name: "Irina", surname: "Ten", age: 22, temperature: 37.9, pain: .tooth, doctor: badDoctor, like: randomBool())
        let patient_5 = AKPatient(name: "Rina", surname: "Kim", age: 26, temperature: 39.0, pain: .stomache, doctor: badDoctor, like: randomBool())
        let patient_6 = AKPatient(name: "Mikhail", surname: "Li", age: 28, temperature: 36.0, pain: .head, doctor: doctor, like: randomBool())
        
       // let result = patient_1.areOk() ? "OK" : "BAD"
        
        let arrayPeople = [patient_1, patient_2, patient_3, patient_4, patient_5, patient_6]
        
        for human in arrayPeople {
            print("Patient \(human.name) is \(human.areOk() ? "OK" : "BAD")")
        }
        
        print("")
        print("PATIENT LIST")
        for key in doctor.patientList.keys {
            print("Patient \(key) have pain \(doctor.patientList[key] ?? "No object")")
        }
        
        //print("Patient \(patient_1.name) is \(result)")
        
        print("______________________________________________")
        func randomBool() -> Bool {
            return arc4random() % 2 == 1
        }
        
        for human in arrayPeople {
            if !human.likeOrDislike && human.doctor is AKDoctor {
                human.doctor = badDoctor
                human.likeOrDislike = true
            } else if !human.likeOrDislike && human.doctor is BadDoctor {
                human.doctor = doctor
                human.likeOrDislike = true
            }
        }
        
        print("NEW CHECK")
        for human in arrayPeople {
            var doctorName: String = String()
            if let doc =  human.doctor as? AKDoctor {
                doctorName = doc.name
            } else if let doc = human.doctor as? BadDoctor {
                doctorName = doc.name
            }
            print("Patient \(human.name) have doctor \(doctorName).")
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

