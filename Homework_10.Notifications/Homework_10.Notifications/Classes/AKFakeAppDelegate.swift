//
//  AKFakeAppDelegate.swift
//  Homework_10.Notifications
//
//  Created by Aleksandr Kan on 23.08.2021.
//

import UIKit
import Foundation


class FakeDelegate {
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(sceneDidBecomeActive),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillResignActive),
                                               name: UIApplication.willResignActiveNotification,
                                               object: nil)
    }
    
    @objc func sceneDidBecomeActive(notification: Notification) {
        print("Class FakeAppDelegate did become ACTIVE.")
    }
    
    @objc func applicationWillResignActive(notification: Notification) {
        print("Class FakeAppDelegate will resign ACTIVE.")
    }
}
