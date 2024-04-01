//
//  AppDelegate.swift
//  QuizApp
//
//  Created by mac on 24/03/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

//    var allQuestions = [QuestionModel]()
    
    var allQuestions = [QuestionModel(question: "What is the capital of Spain?", correctans: "Madrid", incorrectans1: "Barcelona", incorrectans2: "Rome", incorrectans3: "Paris"),
                        QuestionModel(question: "Who wrote 'To Kill a Mockingbird'?", correctans: "Harper Lee", incorrectans1: "J.K. Rowling", incorrectans2: "Stephen King", incorrectans3: "Charles Dickens"),
                        QuestionModel(question: "What is the chemical symbol for gold?", correctans: "Au", incorrectans1: "Ag", incorrectans2: "Fe", incorrectans3: "Cu"),
                        QuestionModel(question: "What is the largest ocean on Earth?", correctans: "Pacific Ocean", incorrectans1: "Atlantic Ocean", incorrectans2: "Indian Ocean", incorrectans3: "Arctic Ocean"),
                        QuestionModel(question: "Who discovered penicillin?", correctans: "Alexander Fleming", incorrectans1: "Albert Einstein", incorrectans2: "Isaac Newton", incorrectans3: "Marie Curie")
            ]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
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

