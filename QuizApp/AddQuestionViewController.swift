//
//  AddQuestionViewController.swift
//  QuizApp
//
//  Created by mac on 25/03/2024.
//

import UIKit

class AddQuestionViewController: UIViewController {

    var newQuestion = QuestionModel()
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
  
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var correctAnsField: UITextField!
    
    
    @IBOutlet weak var incorrectAns1Field: UITextField!
    
    @IBOutlet weak var incorrectAns2Field: UITextField!
  
    @IBOutlet weak var incorrectAns3Field: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       title = "Question Builder"
    }
    
    
    
    @IBAction func cancel(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    
    
    @IBAction func save(_ sender: Any) {
        
        guard let goodQuestionText = questionTextField.text, !goodQuestionText.isEmpty,
           let goodCorrectAns = correctAnsField.text, !goodCorrectAns.isEmpty,
           let goodIncorrectAns1 = incorrectAns1Field.text, !goodIncorrectAns1.isEmpty,
           let goodIncorrectAns2 = incorrectAns2Field.text, !goodIncorrectAns2.isEmpty,
           let goodIncorrectAns3 = incorrectAns3Field.text, !goodIncorrectAns3.isEmpty else {
            // Show alert for invalid input
            print("empty fields")
            showAlert(message: "Kindly complete all fields to build question")
            return
        }
        print("non-empty fields")
            newQuestion.question = goodQuestionText
            newQuestion.correctans = goodCorrectAns
            newQuestion.incorrectans1 = goodIncorrectAns1
            newQuestion.incorrectans2 = goodIncorrectAns2
            newQuestion.incorrectans3 = goodIncorrectAns3
        
        appDelegate?.allQuestions.append(newQuestion)
        print(appDelegate?.allQuestions[0].question)
        dismiss(animated: true)
            
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "All fields must be completed!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
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
