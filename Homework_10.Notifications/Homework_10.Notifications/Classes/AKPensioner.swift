//
//  AKPensioner.swift
//  Homework_10.Notifications
//
//  Created by Aleksandr Kan on 21.08.2021.
//
import UIKit
import Foundation


class Pensioner {
    var name = "No name"
    var pension = 0.0
    var averagePrise = 0.0
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(pensionInfo),
                                               name: NSNotification.Name.AKGovernmentPensionDidChangeNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(averagePriseInfo),
                                               name: Notification.Name.AKGovernmentAveragePriceDidChangeNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(inflatIoninfo),
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
        print("Class Pensioner did become active.")
    }
    
    @objc func applicationWillResignActive(notification: Notification) {
        print("Class Pensioner will resign active.")
    }
    
    
    @objc func pensionInfo(notification: Notification) {
        let value: [AnyHashable: Any] = notification.userInfo!
        let number = value[Notification.Name.AKGovernmentPensionUserInfoKey] as! Double
        //Old note
       // let number = duration as! Float
        
        print("Pension is change! Pension: \(number)")
    }
    
    @objc func averagePriseInfo(notification: Notification) {
        let value = notification.userInfo!
        let number = value[Notification.Name.AKGovernmentAveragePriceUserInfoKey] as! Double
        print("Average price for pensioner \(self.name) is change. Average price total: \(number)")
    }
    
    @objc func inflatIoninfo(notification: Notification) {
        let value = notification.userInfo!
        let number = value[Notification.Name.AKGovernmentInflationUserInfoKey] as! Double
        print("Inflation for pensioner \(self.name) is change. Inflation total: \(number)%")
        self.infaltionReaction(inflation: number)
    }
    
    func infaltionReaction(inflation value: Double) {
        switch value {
            case let size where size <= 2.0:
                print("Pensioner \(self.name) say: - Life perfect!")
            case let size where size > 2.0 && size <= 4.0:
                print("Pensioner \(self.name) say: - Good pension - Good mood!")
            case let size where size > 4.0 && size <= 6.0:
                print("Pensioner \(self.name) say: - Normal life!")
            default:
                print("Pensioner \(self.name) say: - Bad economic! Bad mood! Bad Life")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
