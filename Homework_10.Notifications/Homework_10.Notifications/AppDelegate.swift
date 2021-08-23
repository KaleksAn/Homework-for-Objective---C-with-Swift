//
//  AppDelegate.swift
//  Homework_10.Notifications
//
//  Created by Aleksandr Kan on 21.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let government = Government(salary: 1500.0,
                                averagePrice: 550.0,
                                taxLevel: 255.0,
                                pension: 550.0)
    let pensioner = Pensioner()
    let doctor = Doctor()
    let businessman = Businessman()
    let fakeApplication = FakeDelegate()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.pensioner.name = "Rick"
        self.pensioner.pension = self.government.pension
        self.pensioner.averagePrise = self.government.averagePrice
        
        self.doctor.name = "Dr. House"
        self.doctor.salary = self.government.salary
        self.doctor.averagePrise = self.government.averagePrice
        
        self.businessman.name = "Ilon Mask"
        self.businessman.taxLevel = self.government.taxLevel
        self.businessman.averagePrise = self.government.averagePrice
        
    
        self.government.averagePrice = 550.0
        self.government.averagePrice = 555.0
        self.government.averagePrice = 590.0
        
        self.government.pension = 222;
        self.government.pension = 223;
        self.government.pension = 500;
        
        self.government.salary = 1200.0
        self.government.salary = 800.0
        self.government.salary = 1750.0
        
        self.government.taxLevel = 350.0
        self.government.taxLevel = 330.0
        self.government.taxLevel = 600.0
        
        
      
        
        
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


