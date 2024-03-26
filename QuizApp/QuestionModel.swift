//
//  QuestionModel.swift
//  QuizApp
//
//  Created by mac on 24/03/2024.
//

import Foundation

class QuestionModel {
    
    var question : String?
    var correctans: String?
    var incorrectans1: String?
    var incorrectans2: String?
    var incorrectans3: String?
     
    init(question: String, correctans: String, incorrectans1: String, incorrectans2: String, incorrectans3: String) {
        self.question = question
        self.correctans = correctans
        self.incorrectans1 = incorrectans1
        self.incorrectans2 = incorrectans2
        self.incorrectans3 = incorrectans3
    }
    
    init(){
        self.question = ""
        self.correctans = ""
        self.incorrectans1 = ""
        self.incorrectans2 = ""
        self.incorrectans3 = ""
    }
}
