//
//  AKGovernment.swift
//  Homework_10.Notifications
//
//  Created by Aleksandr Kan on 21.08.2021.
//

import Foundation

extension Notification.Name {
    static let AKGovernmentPensionDidChangeNotification = Notification.Name("AKGovernmentPensionDidChangeNotification")
    static let AKGovernmentSalaryDidChangeNotification = Notification.Name("AKGovernmentSalaryDidChangeNotification")
    static let AKGovernmentAveragePriceDidChangeNotification = Notification.Name("AKGovernmentAveragePriceDidChangeNotification")
    static let AKGovernmentTaxLevelDidChangeNotification = Notification.Name("AKGovernmentTaxLevelDidChangeNotification")
    static let AKGovernmentInflationDidChangeNotification = Notification.Name("AKGovernmentInflationDidChangeNotification")
    
    static let AKGovernmentPensionUserInfoKey = "AKGovernmentPensionUserInfoKey"
    static let AKGovernmentSalaryUserInfoKey = "AKGovernmentSalaryDidChangeNotification"
    static let AKGovernmentAveragePriceUserInfoKey = "AKGovernmentAveragePriceUserInfoKey"
    static let AKGovernmentTaxLevelUserInfoKey = "AKGovernmentTaxLevelUserInfoKey"
    static let AKGovernmentInflationUserInfoKey = "AKGovernmentInflationUserInfoKey"
}


class Government {
    var salary: Double {
        didSet {
            let dictionary = [Notification.Name.AKGovernmentSalaryUserInfoKey: salary]
            NotificationCenter.default.post(name: Notification.Name.AKGovernmentSalaryDidChangeNotification,
                                            object: nil,
                                            userInfo: dictionary)
        }
    }
    
    var averagePrice: Double {
        didSet {
            self.inflation = (averagePrice - oldValue) / averagePrice * 100
            let dictionary = [Notification.Name.AKGovernmentAveragePriceUserInfoKey: averagePrice]
            NotificationCenter.default.post(name: Notification.Name.AKGovernmentAveragePriceDidChangeNotification,
                                            object: nil,
                                            userInfo: dictionary)
            
            
        }
    }
    
    var taxLevel: Double {
        didSet {
            let dictionary = [NSNotification.Name.AKGovernmentTaxLevelUserInfoKey: taxLevel]
            NotificationCenter.default.post(name: NSNotification.Name.AKGovernmentTaxLevelDidChangeNotification,
                                            object: nil,
                                            userInfo: dictionary)
        }
    }
    
    var pension: Double {
        didSet {
            let dictionary = [Notification.Name.AKGovernmentPensionUserInfoKey: pension]
            NotificationCenter.default.post(name: Notification.Name.AKGovernmentPensionDidChangeNotification,
                                            object: nil,
                                            userInfo: dictionary)
        }
    }
    
    var inflation: Double = 0.0 {
        didSet {
            let dictionary = [Notification.Name.AKGovernmentInflationUserInfoKey: inflation]
            NotificationCenter.default.post(name: Notification.Name.AKGovernmentInflationDidChangeNotification,
                                            object: nil,
                                            userInfo: dictionary)
        }
    }
    
    //_inflation = (inflation - _averagePrice) / inflation * 100;
    
    init(salary: Double, averagePrice: Double, taxLevel: Double, pension: Double) {
        self.salary = salary
        self.averagePrice = averagePrice
        self.taxLevel = taxLevel
        self.pension = pension
        //self.inflation = 0.0
    }
}
