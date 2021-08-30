//
//  Patient.swift
//  Homework_12.Closers and Blocks
//
//  Created by Aleksandr Kan on 29.08.2021.
//

import Foundation



class Patient {
    var name: String
    var temperature = Double((Double((arc4random() % UInt32(36.6))) + 360.0) / 10.0)
    //var block: (Patient) -> Void
    
    init(name: String, block1: @escaping (Patient) -> Void) {
        self.name = name
        //self.block = block1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(10)) {
            self.youOk(block: block1)
            }
        
        
    }
    
    func youOk(block: (Patient) -> Void ) {
        let youOk = arc4random() % 2 == 0
      //  weak var linkWeak = self
        
        if !youOk {
            block(self)
        } else {
            print("Patient \(self.name) OK!")
        }
    }
    
    func takePill() {
        print("Patient \(self.name) take pill. Temperature \(self.temperature)")
    }
    
    func makeShot() {
        print("Patient \(self.name) make shot. Temperature \(self.temperature)")
    }
    
    
    deinit {
        print("PATIENT \(self.name) FROM CLASS PATIENT DEINIT!")
    }
    
}
