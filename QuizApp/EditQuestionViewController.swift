//
//  EditQuestionViewController.swift
//  QuizApp
//
//  Created by mac on 26/03/2024.
//

import UIKit

class EditQuestionViewController: UIViewController {
    
    var question: QuestionModel?
    var selectionIndex: Int = 0
    
    var updatedQuestion = QuestionModel()
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var correctAnsField: UITextField!
    
    @IBOutlet weak var incorrectAns1Field: UITextField!
    
    @IBOutlet weak var incorrectAns2Field: UITextField!
    
    @IBOutlet weak var incorrectAns3Field: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Question"
        // Do any additional setup after loading the view.
        questionTextField.text = question?.question
        correctAnsField.text = question?.correctans
        incorrectAns1Field.text = question?.incorrectans1
        incorrectAns2Field.text = question?.incorrectans2
        incorrectAns3Field.text = question?.incorrectans3
    }
    
    
    @IBAction func cancelClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func saveClicked(_ sender: Any) {
        
        updatedQuestion.question = questionTextField.text
        updatedQuestion.correctans = correctAnsField.text
        updatedQuestion.incorrectans1 = incorrectAns1Field.text
        updatedQuestion.incorrectans2 = incorrectAns2Field.text
        updatedQuestion.incorrectans3 = incorrectAns3Field.text
        
        appDelegate?.allQuestions[selectionIndex] = updatedQuestion
        dismiss(animated: true)
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
