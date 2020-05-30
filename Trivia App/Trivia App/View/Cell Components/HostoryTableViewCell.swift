//
//  HostoryTableViewCell.swift
//  Trivia App
//
//  Created by Venkat on 29/05/20.
// Copyright @ 2020 Venkat. All rights reserved.
//

import UIKit

class HostoryTableViewCell: UITableViewCell {

    class var identifier : String {
        
        return "\(self)"
    }
    
    
    @IBOutlet weak var gameNumAndCreatedDateLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var whoIsBestCricketerQuestionLbl: UILabel!
    @IBOutlet weak var bestCricketerAnswerLbl: UILabel!
    @IBOutlet weak var whatAreTheColorsInTheNationalFlagQuestionLbl: UILabel!
    @IBOutlet weak var nationalFlagColorsAnswerLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(game : Game , index : Int) {
        
        var createdDate = String()
        if let dateTime = game.createdDate{
            
            createdDate = dateTime
        }

        self.gameNumAndCreatedDateLbl.text = "Game \(index + 1) : \(createdDate)"
        
        self.nameLbl.text = "Name : \(game.userName ?? "")"
        
        self.whoIsBestCricketerQuestionLbl.text = "Who is the best cricketer in the world?"
        if let cricketerName = game.cricketerName{
            self.bestCricketerAnswerLbl.text =  "Answer : \(cricketerName )"
        }
        self.whatAreTheColorsInTheNationalFlagQuestionLbl.text = "What are the colors in the national flag?"
        if let flagColors = game.flagColors{
             self.nationalFlagColorsAnswerLbl.text = "Answers : " + flagColors.joined(separator: ",")
        }
       
    }
}
