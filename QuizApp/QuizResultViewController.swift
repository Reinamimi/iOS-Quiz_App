//
//  QuizResultViewController.swift
//  QuizApp
//
//

import UIKit

class QuizResultViewController: UIViewController {

    
    @IBOutlet weak var resultLbl: UILabel!
    
    var totalPoints: Int?
    var totalNumQuestions: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Quiz Results"
        if let totalPoints = totalPoints, let totalNumQuestions = totalNumQuestions {
            resultLbl.text = "\(totalPoints) / \(totalNumQuestions)"
        }
    }
    
    @IBAction func homeClicked(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
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
