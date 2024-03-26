//
//  QuestionBankViewController.swift
//  QuizApp
//
//  Created by mac on 24/03/2024.
//

import UIKit

class QuestionBankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var localQuestionList = (UIApplication.shared.delegate as? AppDelegate)?.allQuestions
    
//    var localQuestionList = [QuestionModel(question: "ques1", correctans: "reina", incorrectans1: "test1", incorrectans2: "test2", incorrectans3: "test3")]
    
    @IBOutlet weak var questionTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Question Bank"
       

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        localQuestionList = (UIApplication.shared.delegate as? AppDelegate)?.allQuestions
//        print(localQuestionList!.count)
        questionTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localQuestionList!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print ("in here test1")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? QuestionTableViewCell
        
        print ("in here")
        
        cell?.questionText.text = localQuestionList![indexPath.row].question
        cell?.correctAnswer.text = localQuestionList![indexPath.row].correctans
        cell?.incorrectAnswer1.text = localQuestionList![indexPath.row].incorrectans1
        cell?.incorrectAnswer2.text = localQuestionList![indexPath.row].incorrectans2
        cell?.incorrectAnswer3.text = localQuestionList![indexPath.row].incorrectans3
        
        return cell!
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
