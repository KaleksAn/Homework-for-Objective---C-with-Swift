//
//  Protocols.swift
//  Protocols.Lesson_07
//
//  Created by Aleksandr Kan on 03.07.2021.
//  Copyright © 2021 AK. All rights reserved.
//

import Foundation


@objc protocol Jumpers {
    
    var maxHeight: Double { get }
    func jump()
    
    @objc optional var age: Int { get }
    @objc optional var name: String { get }
    @objc optional func sleep()
}


@objc protocol Swimmers {
    
    var maxSpeed: Double { get }
    func swim()
    
    @objc optional var age: Int { get }
    @objc optional var name: String { get }
    @objc optional func play()
}


@objc protocol Runners {
    
    var maxDistance: Double { get }
    func run()
    
    @objc optional var age: Int { get }
    @objc optional var name: String { get }
    @objc optional func wash()
}
