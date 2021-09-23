//
//  AppDelegate.swift
//  Homework_14.String's
//
//  Created by Aleksandr Kan on 14.09.2021.
//

import UIKit
import Foundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        let text = "Threads are a relatively lightweight way to implement multiple paths of execution inside of an application. At the system level, programs run side by side, with the system doling out execution time to each program based on its needs and the needs of other programs. Inside each program, however, exists one or more threads of execution, which can be used to perform different tasks simultaneously or in a nearly simultaneous manner. The system itself actually manages these threads of execution, scheduling them to run on the available cores and preemptively interrupting them as needed to allow other threads to run. From a technical standpoint, a thread is a combination of the kernel-level and application-level data structures needed to manage the execution of code. The kernel-level structures coordinate the dispatching of events to the thread and the preemptive scheduling of the thread on one of the available cores. The application-level structures include the call stack for storing function calls and the structures the application needs to manage and manipulate the thread’s attributes and state. In a non-concurrent application, there is only one thread of execution. That thread starts and ends with your application’s main routine and branches one-by-one to different methods or functions to implement the application’s overall behavior. By contrast, an application that supports concurrency starts with one thread and adds more as needed to create additional execution paths. Each new path has its own custom start routine that runs independently of the code in the application’s main routine. Having multiple threads in an application provides two very important potential advantages: Multiple threads can improve an application’s perceived responsiveness. Multiple threads can improve an application’s real-time performance on multicore systems. If your application has only one thread, that one thread must do everything. It must respond to events, update your application’s windows, and perform all of the computations needed to implement your application’s behavior. The problem with having just one thread is that it can only do one thing at a time. So what happens when one of your computations takes a long time to finish? While your code is busy computing the values it needs, your application stops responding to user events and updating its windows. If this behavior continues long enough, a user might think your application is hung and try to forcibly quit it. If you moved your custom computations onto a separate thread, however, your application’s main thread would be free to respond to user interactions in a more timely manner. With multicore computers common these days, threads provide a way to increase performance in some types of applications. Threads that perform different tasks can do so simultaneously on different processor cores, making it possible for an application to increase the amount of work it does in a given amount of time. Of course, threads are not a panacea for fixing an application’s performance problems. Along with the benefits offered by threads come the potential problems. Having multiple paths of execution in an application can add a considerable amount of complexity to your code. Each thread has to coordinate its actions with other threads to prevent it from corrupting the application’s state information. Because threads in a single application share the same memory space, they have access to all of the same data structures. If two threads try to manipulate the same data structure at the same time, one thread might overwrite another’s changes in a way that corrupts the resulting data structure. Even with proper protections in place, you still have to watch out for compiler optimizations that introduce subtle (and not so subtle) bugs into your code."
        
        
        
        print("\(text.distance(from: text.startIndex, to: text.endIndex))")
        
        //Method 1
        print("METHOD #1")
        let (part1, part2) = self.partText(text: text)
        
        print("PART 1 - \(part1)")
        print("PART 2 - \(part2)")
        
        
        //Method 2
        print("")
        print("METHOD #2")
        let (p1, p2) = partText2(text: text)
        
        print("PART 1 - \(p1)")
        print("PART 2 - \(p2)")
        
        
        
        //String's on array
        print("")
        print("String's on array")
        var arrayForString = [String]()
        var newArrayForStr = [String]()
        var reverseStrings = [String]()
        
        arrayForString.append(contentsOf: text.components(separatedBy: "."))
        
        for str in arrayForString {
        
            if str.lowercased().contains("threads") {
                newArrayForStr.append(str)
                reverseStrings.append(String(str.lowercased().reversed()))
                
            }
            
            
            
        }
        
        print("")
        print("New array contains")
        print("Array count \(newArrayForStr.count)")
        for str in newArrayForStr {
            print(str)
        }
        
        print("")
        print("REVERSE TEXT")
        let newText = String(text.reversed()).lowercased()
        let finishText = String(newText.capitalized.reversed())
        print("\n\t\t\t\tFINISHED TEXT FOR SUPERMAN")
        print("\(finishText)")
        
        
        return true
    }

    
    //MARK: - My method's
    
    
    //First just method
    fileprivate func partText(text: String) -> (String, String) {
        var firstPart = ""
        var secondPart = ""
        var count = 0
        
        let (partCount_1, _) = self.countPart(count: text.count)
        
        for symbol in text {
            if count < partCount_1 {
                firstPart.append(symbol)
                
            }
            
            if count >= partCount_1 {
                secondPart.append(symbol)
            }
            
            count += 1
        }
        
        return (firstPart, secondPart)
    }
    
    
    //Second method
    //Perfect method
    fileprivate func partText2(text: String) -> (String, String) {
        let (count1, _) = countPart(count: text.count)
        let starT = text.index(text.startIndex, offsetBy: 0)
        let enD = text.index(text.startIndex, offsetBy: count1)
        
        let range1 = starT..<enD
        let range2 = enD..<text.endIndex
        
    
        return ("\(text[range1])", "\(text[range2])")
    }
    
    
    fileprivate func countPart(count: Int) -> (Int, Int) {
        var partCount_1 = 0
        var partCount_2 = 0
        let result = count / 2
        
        if count % 2 == 0 {
            partCount_1 = result
            partCount_2 = result
        } else {
            partCount_1 = result
            partCount_2 = result + 1
        }
        
        return (partCount_1, partCount_2)
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

