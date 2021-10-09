//
//  AKStudent.swift
//  Homework_16.Date
//
//  Created by Aleksandr Kan on 09.10.2021.
//

import Foundation

fileprivate let arrayName = ["Marina", "Violetta", "Tanya", "Alina", "Nastya", "Alex", "Vova", "Dima", "Sergey", "Nikita"]
fileprivate let arraySurname = ["Kim", "Pak", "Ten", "Nogay", "Li", "Shek", "Lem", "Kogay", "Hen", "Em"]


class AKStudent: NSObject {
    
    var dateBirth: Date
    let name: String = {
        let randomIndex = Int(arc4random()) % arrayName.count
        return arrayName[randomIndex]
    }()
    
    let surname:String = {
        let randomIndex = Int(arc4random()) % arraySurname.count
        return arraySurname[randomIndex]
    }()
    
    override init() {
        
        let date = Date()
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.day, .month, .year], from: date)
        var component = DateComponents()
        component.day = Int(arc4random()) % 13
        component.month = Int(arc4random()) % 32
        component.year = dateComponents.year! - (Int(arc4random()) % 35 + 16)
        self.dateBirth = calendar.date(from: component)!
    }
    
    override var description: String {
        return "Name: \(self.name) \(self.surname). Date: \(dateBirth)"
    }
    
    //Функция класса для создания объекта
    //Функция работает через рекурсию
    static func createStudents(count: Int) -> [AKStudent] {
        var studentList = [AKStudent]()
        let countStudents = count
        
        guard countStudents >= 1 else {
//            let student = AKStudent()
//            studentList.append(student)
            
            return studentList
        }
        
        //Создание объектов циклом
//        for _ in 1...30 {
//            let student = AKStudent()
//            studentList.append(student)
//        }
        
        let student = AKStudent()
        studentList.append(student)
        
        return studentList + createStudents(count: countStudents - 1)
    }
    
    
}
