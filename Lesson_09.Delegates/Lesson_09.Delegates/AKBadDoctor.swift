//
//  AKBadDoctor.swift
//  Lesson_09.Delegates
//
//  Created by Aleksandr Kan on 18.08.2021.
//

import Foundation


class BadDoctor: AKPatientDelegate {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    
    
    func patientCheck(patient: AKPatient) {
        let temperature = patient.temperature
        
        if temperature > 36.6 && temperature < 37.0 {
            print("Patient \(patient.name) DANCE")
        } else if temperature >= 37.0 && temperature <= 38.0 {
            self.takeRandomPill(patient: patient)
        } else if temperature > 38.0 {
            self.makeShot(patient: patient)
        } else {
            print("Temperature for \(patient.name) OK. BAD DOCTOR IT'S OK.")
        }
        
    }
    
    func patientHaveQuestion(patient: AKPatient, question: String) {
        
    }
    
    func takeRandomPill(patient: AKPatient) {
        print("Patient \(patient.name) take RANDOM pill on Ibiza")
    }
    
    func makeShot(patient: AKPatient) {
        print("Patient \(patient.name) make ADRENALINE shot.")
    }
    
}




