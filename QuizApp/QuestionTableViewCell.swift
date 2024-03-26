//
//  QuestionTableViewCell.swift
//  QuizApp
//
//  Created by mac on 25/03/2024.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var correctAnswer: UILabel!
    
    @IBOutlet weak var incorrectAnswer1: UILabel!
    
    @IBOutlet weak var incorrectAnswer2: UILabel!

    @IBOutlet weak var incorrectAnswer3: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
