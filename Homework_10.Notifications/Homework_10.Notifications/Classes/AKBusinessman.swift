//
//  AKBusinessman.swift
//  Homework_10.Notifications
//
//  Created by Aleksandr Kan on 22.08.2021.
//

import UIKit
import Foundation

class Businessman {
    var name = "No name"
    var taxLevel = 0.0
    var averagePrise = 0.0
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(taxLevelInfo),
                                               name: Notification.Name.AKGovernmentTaxLevelDidChangeNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(averagePriseinfo),
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
        print("Class Businessman did become active.")
    }
    
    @objc func applicationWillResignActive(notification: Notification) {
        print("Class Businessman will resign active.")
    }
    
    @objc func taxLevelInfo(notification: Notification) {
        let value: [AnyHashable: Any] = notification.userInfo!
        let number = value[Notification.Name.AKGovernmentTaxLevelUserInfoKey] as! Double
        print("Tax level for businessman \(self.name) is change! Tax level total: \(number)")
    }
    
    @objc func averagePriseinfo(notification: Notification) {
        let value = notification.userInfo!
        let number = value[Notification.Name.AKGovernmentAveragePriceUserInfoKey] as! Double
        print("Average price for businessman \(self.name) is change. Average price total: \(number)")
    }
    
    @objc func inflationInfo(notification: Notification) {
        let value = notification.userInfo!
        let number = value[Notification.Name.AKGovernmentInflationUserInfoKey] as! Double
        print("Inflation for businessman \(self.name) is change. Inflation total: \(number)%")
        self.infaltionReaction(inflation: number)
    }
    
    func infaltionReaction(inflation value: Double) {
        switch value {
            case let size where size <= 2.0:
                print("Businessman \(self.name) say: - Perfect economic - Perfect business")
            case let size where size > 2.0 && size <= 4.0:
                print("Businessman \(self.name) say: - Good economic - Good business")
            case let size where size > 4.0 && size <= 6.0:
                print("Businessman \(self.name) say: - Oh... All right!")
            default:
                print("Businessman \(self.name) say: - I'm loose! My Business was crash!")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
