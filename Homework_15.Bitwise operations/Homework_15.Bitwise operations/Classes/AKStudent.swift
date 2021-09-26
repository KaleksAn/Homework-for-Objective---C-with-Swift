//
//  AKStudent.swift
//  Homework_15.Bitwise operations
//
//  Created by Aleksandr Kan on 23.09.2021.
//

import Foundation


enum AKStudentSubjectType: UInt8 {
    
    case AKStudentTypeMath          = 0b00000001
    case AKStudentTypeArt           = 0b00000010
    case AKStudentTypeComputerSince  = 0b00000100
    case AKStudentTypeHistory       = 0b00001000
    case AKStudentTypeEngeeniring   = 0b00010000
    case AKStudentTypeAnatomy       = 0b00100000
    case AKStudentTypePsyhology     = 0b01000000
    case AKStudentTypeBiology       = 0b10000000
}


class Student: NSObject {
    static var countDevelopers = 0
    
    var name: String
    var lessons: AKStudentSubjectType.RawValue
    
    var technicalLessons: Int {
        get {
            
            var count = 0
            if (self.lessons & AKStudentSubjectType.AKStudentTypeMath.rawValue) != 0 { count += 1 }
            if (self.lessons & AKStudentSubjectType.AKStudentTypeEngeeniring.rawValue) != 0 { count += 1 }
            if (self.lessons & AKStudentSubjectType.AKStudentTypeComputerSince.rawValue) != 0 { count += 1; Student.countDevelopers += 1 }
            
            return count
        }
    }
    
    var humanitarianLessons: Int {
        
        get {
            var count = 0
            
            if (self.lessons & AKStudentSubjectType.AKStudentTypeBiology.rawValue) != 0 { count += 1 }
            if (self.lessons & AKStudentSubjectType.AKStudentTypeArt.rawValue) != 0 { count += 1 }
            if (self.lessons & AKStudentSubjectType.AKStudentTypeAnatomy.rawValue) != 0 { count += 1 }
            if (self.lessons & AKStudentSubjectType.AKStudentTypePsyhology.rawValue) != 0 { count += 1 }
            if (self.lessons & AKStudentSubjectType.AKStudentTypeHistory.rawValue) != 0 { count += 1 }
            
            return count
        }
        
    }
//
    
    init(name: String, lessons: AKStudentSubjectType.RawValue) {
        self.name = name
        self.lessons = lessons
    }
    
     class func description(student: Student) -> String {
        
        let resultStr = "Math: \(student.checkStatusSubject(subject: 1))\n" +
                       "Art: \(student.checkStatusSubject(subject: 2))\n" +
                       "Computer since: \(student.checkStatusSubject(subject: 4))\n" +
                       "History: \(student.checkStatusSubject(subject: 8))\n" +
                       "Engeeniring: \(student.checkStatusSubject(subject: 16))\n" +
                       "Anatomy: \(student.checkStatusSubject(subject: 32))\n" +
                       "Psyhology: \(student.checkStatusSubject(subject: 64))\n" +
                       "Biology: \(student.checkStatusSubject(subject: 128))"
                    
        
        return resultStr
        
    }
    
    override var description: String {
        return "Math: \(self.checkStatusSubject(subject: 1))\n" +
               "Art: \(self.checkStatusSubject(subject: 2))\n" +
               "Computer since: \(self.checkStatusSubject(subject: 4))\n" +
               "History: \(self.checkStatusSubject(subject: 8))\n" +
               "Engeeniring: \(self.checkStatusSubject(subject: 16))\n" +
               "Anatomy: \(self.checkStatusSubject(subject: 32))\n" +
               "Psyhology: \(self.checkStatusSubject(subject: 64))\n" +
               "Biology: \(self.checkStatusSubject(subject: 128))"
    }
    
    
    func checkStatusSubject(subject: AKStudentSubjectType.RawValue) -> String {
        
        return ((self.lessons & subject) != 0) ? "YES" : "NO"
    }
    
    
    
    func resetBiology() {
        if (self.lessons & AKStudentSubjectType.AKStudentTypeBiology.rawValue) != 0 {
            self.lessons &= ~(AKStudentSubjectType.AKStudentTypeBiology.rawValue)
            print("Сработало  для \(self.name)")
        }
    }
    
    
    
    /*
     func technicalOrHumanitary(student: AKStudentSubjectType.RawValue) -> Bool {
         
         if (student & AKStudentSubjectType.AKStudentTypeMath.rawValue) != 0 {
             return true
         } else if (student & AKStudentSubjectType.AKStudentTypeComputerSince.rawValue) != 0 {
             Student.countDevelopers += 1
             return true
         } else if (student & AKStudentSubjectType.AKStudentTypeEngeeniring.rawValue) != 0 {
             return true
         } else {
             return false
         }
     }
     */
    
    
//    func countLessons() {
//
////        if (self.lessons & AKStudentSubjectType.AKStudentTypeBiology.rawValue) != 0 { self.humanitarianLessons += 1 }
////        if (self.lessons & AKStudentSubjectType.AKStudentTypeArt.rawValue) != 0 { self.humanitarianLessons += 1 }
////        if (self.lessons & AKStudentSubjectType.AKStudentTypeAnatomy.rawValue) != 0 { self.humanitarianLessons += 1 }
////        if (self.lessons & AKStudentSubjectType.AKStudentTypePsyhology.rawValue) != 0 { self.humanitarianLessons += 1 }
////        if (self.lessons & AKStudentSubjectType.AKStudentTypeHistory.rawValue) != 0 { self.humanitarianLessons += 1 }
////        if (self.lessons & AKStudentSubjectType.AKStudentTypeMath.rawValue) != 0 { self.technicalLessons += 1 }
////        if (self.lessons & AKStudentSubjectType.AKStudentTypeEngeeniring.rawValue) != 0 { self.technicalLessons += 1 }
////        if (self.lessons & AKStudentSubjectType.AKStudentTypeComputerSince.rawValue) != 0 { self.technicalLessons += 1 }
//
//    }
    
    
    
}
