//
//  AKDoctor.swift
//  Lesson_09.Delegates
//
//  Created by Aleksandr Kan on 18.08.2021.
//

import Foundation


class AKDoctor: AKPatientDelegate {
    
    var name: String
    var patientList: [String: String] = [:]
    
    init(name: String) {
        self.name = name
    }
    
    func patientCheck(patient: AKPatient) {
        
        if patient.temperature > 36.6 && patient.temperature < 37.0 {
            print("Patient \(patient.name) REST")
        } else if patient.temperature >= 37.0 && patient.temperature <= 38.0 {
            patient.takePill()
            patient.likeOrDislike = !patient.likeOrDislike
        } else if patient.temperature > 38.0 {
            patient.makeShot()
            patient.likeOrDislike = !patient.likeOrDislike
        } else {
            print("Temperature for \(patient.name) ok. Just he will be rest.")
        }
        
        self.checkPain(patient: patient)
        
    }
    
    func patientHaveQuestion(patient: AKPatient, question: String) {
        
    }
    
    func checkPain(patient: AKPatient) {
        
        let pain = patient.painBody
        let namePain = patient.painBody.rawValue
        
        switch pain {
            case .head:
                self.patientList[patient.fullName] = namePain
            case .foot:
                self.patientList[patient.fullName] = namePain
            case .hand:
                self.patientList[patient.fullName] = namePain
            case .tooth:
                self.patientList[patient.fullName] = namePain
            case .stomache:
                self.patientList[patient.fullName] = namePain
            
        }
    }
    
    
}
