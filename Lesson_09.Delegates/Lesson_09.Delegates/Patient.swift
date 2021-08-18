//
//  Patient.swift
//  Lesson_09.Delegates
//
//  Created by Aleksandr Kan on 18.08.2021.
//

import Foundation

enum Body: String {
    case head = "Head"
    case hand = "Hand"
    case foot = "Foot"
    case tooth = "Tooth"
    case stomache = "Stomache"
}



class AKPatient {
    var name: String
    var surname: String
    var fullName: String {
        return surname + " " + name
    }
    var age: Int
    var temperature: Float
    var doctor: AKPatientDelegate
    var painBody: Body
    var likeOrDislike: Bool
    
    init(name: String, surname: String, age: Int, temperature: Float, pain: Body, doctor: AKPatientDelegate, like: Bool) {
        self.name = name
        self.surname = surname
        self.age = age
        self.temperature = temperature
        self.painBody = pain
        self.doctor = doctor
        self.likeOrDislike = like
        
    }
    
    func areOk() -> Bool {
        let boolVar = arc4random() % 2 == 1
        
        if !boolVar {
            self.doctor.patientCheck(patient: self)
            
        }
        
        
        return boolVar
    }
    
    
    func takePill() {
        print("Patient \(self.name) take a pill on Ibiza. Temperature \(self.temperature)")
    }
    
    func makeShot() {
        print("Patient \(self.name) make shot. Temperature \(self.temperature)")
    }
    
    
}


protocol AKPatientDelegate: AnyObject {
    func patientCheck(patient: AKPatient)
    func patientHaveQuestion(patient: AKPatient, question: String)
}
