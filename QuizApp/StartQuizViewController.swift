//
//  StartQuizViewController.swift
//  QuizApp
//
//  Created by mac on 29/03/2024.
//

import UIKit

class StartQuizViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var questions = (UIApplication.shared.delegate as? AppDelegate)?.allQuestions
    
    var points: Int = 0
    var collectionIndex = 0
    
    var isAnsSelected = false // bool to check if user selects an option
    var isCorrectAns = false 
    
    
    

    @IBOutlet weak var quizCollectionView: UICollectionView!
    
    @IBOutlet weak var quizProgress: UIProgressView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var previousBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "My Quiz"
        if let questionsCount = questions?.count {
            quizProgress.progress = Float(1) / Float(questionsCount)
                    }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {

         return 1
     }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("count of questions: ", questions!.count)
        if questions!.count > 10  {
            return 10
        } else {
            return questions!.count
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        print("in the cell for item")

        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quizCollectionViewCell", for: indexPath) as? QuizCollectionViewCell

        cell?.setValues = questions![indexPath.row]
        cell?.selectedOption = {  isCorrect in
            self.isAnsSelected = true
            self.isCorrectAns = isCorrect
        }
        
        return cell!
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print("in the size for item")
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    @IBAction func previousClicked(_ sender: Any) {
        
        if !(collectionIndex == 0) {
            quizCollectionView.scrollToItem(at: IndexPath(row: (collectionIndex-1), section: 0), at: .left, animated: true)
            collectionIndex -= 1
            points -= 1
            
        }
        isAnsSelected = true
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        
        if !isAnsSelected {
//            show alert
            let alert = UIAlertController(title: "Select one option", message: "Pls select an option before moving forward", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            present(alert,animated: true)
            return
        }
       
        if isCorrectAns {
            points += 1
        }
        if collectionIndex < (questions?.count ?? 0) - 1 {
            collectionIndex += 1
            quizCollectionView.scrollToItem(at: IndexPath(row: collectionIndex, section: 0), at: .right, animated: true)
            isAnsSelected = false
            if let questionsCount = questions?.count {
                quizProgress.progress = Float(collectionIndex + 1) / Float(questionsCount)
                        }
        } else {
            performSegue(withIdentifier: "showResult", sender: nextBtn)
        }
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let resultVC = segue.destination as? QuizResultViewController {
            resultVC.totalPoints = points
            resultVC.totalNumQuestions = questions?.count
        }
    }
    

}
