//
//  AKDoctor.swift
//  Homework_10.Notifications
//
//  Created by Aleksandr Kan on 22.08.2021.
//
import UIKit
import Foundation

class Doctor {
    var name = "No name"
    var salary = 0.0
    var averagePrise = 0.0
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(salaryInfo),
                                               name: Notification.Name.AKGovernmentSalaryDidChangeNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(averagePriceInfo),
                                               name: Notification.Name.AKGovernmentAveragePriceDidChangeNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(inflationInfo),
                                               name: Notification.Name.AKGovernmentInflationDidChangeNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidBecomeActive),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillResignActive),
                                               name: UIApplication.willResignActiveNotification,
                                               object: nil)
    }
    
    @objc func applicationDidBecomeActive(notification: Notification) {
        print("Class Doctor did become active! ")
    }
    
    @objc func applicationWillResignActive(notification: Notification) {
        print("Class Doctor will resign active!")
    }
    
    @objc func salaryInfo(notification: Notification) {
        let value: [AnyHashable: Any] = notification.userInfo!
        let number = value[Notification.Name.AKGovernmentSalaryUserInfoKey] as! Double
        print("Salary for doctor \(self.name) is change! Salary total: \(number)")
    }
    
    @objc func averagePriceInfo(notification: Notification) {
        let value = notification.userInfo!
        let number = value[Notification.Name.AKGovernmentAveragePriceUserInfoKey] as! Double
        print("Average price for doctor \(self.name) is change! Average price total: \(number)")
    }
    
    @objc func inflationInfo(notification: Notification) {
        let value = notification.userInfo!
        let number = value[Notification.Name.AKGovernmentInflationUserInfoKey] as! Double
        print("Inflation for doctor \(self.name) is change. Inflation total: \(Float(number))%")
        self.infaltionReaction(inflation: number)
    }
    
    func infaltionReaction(inflation value: Double) {
        switch value {
            case let size where size <= 2.0:
                print("Doctor \(self.name) say: - Perfect economic situation")
            case let size where size > 2.0 && size <= 4.0:
                print("Doctor \(self.name) say: - Good economic situation")
            case let size where size > 4.0 && size <= 6.0:
                print("Doctor \(self.name) say: - Normal economic situation")
            default:
                print("BAD economic situation for Doctor \(self.name)!")
        }
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
