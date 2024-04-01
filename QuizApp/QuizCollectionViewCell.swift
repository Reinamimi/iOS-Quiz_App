//
//  QuizCollectionViewCell.swift
//  QuizApp
//
//  Created by mac on 27/03/2024.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var ans1Label: UILabel!
    
    @IBOutlet weak var option2Label: UILabel!
    
    @IBOutlet weak var option3Label: UILabel!
    
    @IBOutlet weak var option4Label: UILabel!
    
    @IBOutlet weak var quizProgress: UIProgressView!
    
    @IBOutlet weak var option1Btn: UIButton!
    
    @IBOutlet weak var option2Btn: UIButton!
    
    @IBOutlet weak var option3Btn: UIButton!
    
    @IBOutlet weak var option4Btn: UIButton!
    
    
    private var correctAns : String?
//    private var isCorrectAns : Bool?
//    private var ansSelection : String?
    private var currentposition : Int?
    private var questionsCount: Int?
    
   
    var setProgress: [Int]? {
        didSet {
            currentposition = setProgress![0] + 1
            questionsCount = setProgress![1]
        }
    }

    var setValues: QuestionModel? {
        didSet {
            correctAns = setValues?.correctans
           
                    questionText.text = setValues?.question
                    
                    var optionsArr = [setValues?.correctans, setValues?.incorrectans1, setValues?.incorrectans2, setValues?.incorrectans3]
                    
                    // Shuffle the options array to randomize the order of the options
                    optionsArr.shuffle()
                    
                    // Assign each option to a label, ensuring that each option is assigned only once
                    if let random1 = optionsArr.popLast() {
                        ans1Label.text = random1
                    }
                    if let random2 = optionsArr.popLast() {
                        option2Label.text = random2
                    }
                    if let random3 = optionsArr.popLast() {
                        option3Label.text = random3
                    }
                    if let random4 = optionsArr.popLast() {
                        option4Label.text = random4
                    }
            
        }
    }
    
    override func prepareForReuse() {
        option1Btn.isSelected = false
        option2Btn.isSelected = false
        option3Btn.isSelected = false
        option4Btn.isSelected = false
    }
    
//    define a closure to pass selection result
    var selectedOption: ((_ isCorrectSelection: Bool) -> Void)?
    
    @IBAction func chooseOption(sender: UIButton) {
        switch sender {
        case option1Btn:
            option1Btn.isSelected = true
//            ansSelection = ans1Label.text
            option2Btn.isSelected = false
            option3Btn.isSelected = false
            option4Btn.isSelected = false
            var isCorrect = false
            if correctAns == ans1Label.text {
                isCorrect = true
            }
            selectedOption?(isCorrect)
            
        case option2Btn:
            option2Btn.isSelected = true
            option1Btn.isSelected = false
            option3Btn.isSelected = false
            option4Btn.isSelected = false
//            ansSelection = option2Label.text
            var isCorrect = false
            if correctAns == option2Label.text {
                isCorrect = true
            }
            selectedOption?(isCorrect)
            
        case option3Btn:
            option3Btn.isSelected = true
            option1Btn.isSelected = false
            option2Btn.isSelected = false
            option4Btn.isSelected = false
//            ansSelection = option3Label.text
            var isCorrect = false
            if correctAns == option3Label.text {
                isCorrect = true
            }
            selectedOption?(isCorrect)
            
        case option4Btn:
            option4Btn.isSelected = true
            option1Btn.isSelected = false
            option2Btn.isSelected = false
            option3Btn.isSelected = false
//            ansSelection = option4Label.text
            var isCorrect = false
            if correctAns == option4Label.text {
                isCorrect = true
            }
            selectedOption?(isCorrect)
            
        default:
            break
        }
        if let currentPosition = currentposition, let questionsCount = questionsCount {
            quizProgress.progress = Float(currentPosition) / Float(questionsCount)
                    }
        
    }
    
}
