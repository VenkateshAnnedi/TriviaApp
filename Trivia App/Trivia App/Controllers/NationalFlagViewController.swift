//
//  NationalFlagViewController.swift
//  Trivia App
//
//  Created by Venkat on 29/05/20.
// Copyright @ 2020 Venkat. All rights reserved.
//

import UIKit

class NationalFlagViewController: UIViewController {
    
    var gameModel = Game()

    @IBOutlet weak var option1Btn: UIButton!
    @IBOutlet weak var option2Btn: UIButton!
    @IBOutlet weak var option3Btn: UIButton!
    @IBOutlet weak var option4Btn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    //MARK: - UIView Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
        
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        nextBtn.uiButtonCornerRadius(radius: nextBtn.layer.frame.size.height / 2)
        option1Btn.uiButtonCornerRadius(radius: 5)
        option2Btn.uiButtonCornerRadius(radius: 5)
        option3Btn.uiButtonCornerRadius(radius: 5)
        option4Btn.uiButtonCornerRadius(radius: 5)

        option1Btn.contentHorizontalAlignment = .left
        option2Btn.contentHorizontalAlignment = .left
        option3Btn.contentHorizontalAlignment = .left
        option4Btn.contentHorizontalAlignment = .left
    }
    
    static func getInstance() -> NationalFlagViewController {
        
        let sb = UIStoryboard(name: SB.main, bundle: nil)
        return sb.instantiateViewController(withIdentifier: VC.nationalFlag) as! NationalFlagViewController
    }
    
    /* Setting options from FlagClors Enum
        */

    func setUpUI() {
        
        self.option1Btn.setTitle(FlagColors.option1.rawValue, for: .normal)
        self.option2Btn.setTitle(FlagColors.option2.rawValue, for: .normal)
        self.option3Btn.setTitle(FlagColors.option3.rawValue, for: .normal)
        self.option4Btn.setTitle(FlagColors.option4.rawValue, for: .normal)
        self.nextBtn.alpha = 0.5
        self.nextBtn.isUserInteractionEnabled = false
    }
    
    func addSelectedColorsToModel(color : String){
        
        /* checking colorFlags array from model
         
         // if model has the selected value we are removing that value on selction of same color, if model does not have the selected color we adding it to model
        */
        
        if var arrayOfselectedColors = gameModel.flagColors {
            
            if arrayOfselectedColors.contains(color) {
                
                arrayOfselectedColors.remove(at: (arrayOfselectedColors.firstIndex(of: color))!)
                gameModel.flagColors = arrayOfselectedColors
                
            } else {
                
                arrayOfselectedColors.append(color)
                gameModel.flagColors = arrayOfselectedColors
            }
            
        } else {
            
            var arraySelectedColors = [String]()
            arraySelectedColors.append(color)
            gameModel.flagColors = arraySelectedColors
        }
        
        /* checking condition of minimum selection should be greater than one option
         // if selection less than one we are disabling next button
         
         // if selection greater than one we are enabling next button
         */
        
        if (gameModel.flagColors?.count)! > 1 {
            
            self.nextBtn.alpha = 1.0
            self.nextBtn.isUserInteractionEnabled = true
            
        } else {
            
            self.nextBtn.alpha = 0.5
            self.nextBtn.isUserInteractionEnabled = false
        }
    }
        
    //MARK: - IB Actions
    
    @IBAction func onTapOption1Btn(_ sender: UIButton) {
        
        if option1Btn.isSelected {
            
            option1Btn.isSelected = false
            self.option1Btn.backgroundColor = UIColor.lightGray
           
        } else {
            
            option1Btn.isSelected = true
              self.option1Btn.backgroundColor = UIColor(displayP3Red: 118/255, green: 189/255, blue: 50/255, alpha: 1.0)
        }
        
        addSelectedColorsToModel(color: FlagColors.option1.rawValue)
    }
    
    @IBAction func onTapOption2Btn(_ sender: UIButton) {
        
        if option2Btn.isSelected {
            
            option2Btn.isSelected = false
            self.option2Btn.backgroundColor = UIColor.lightGray
           
        } else {
            
            option2Btn.isSelected = true
              self.option2Btn.backgroundColor = UIColor(displayP3Red: 118/255, green: 189/255, blue: 50/255, alpha: 1.0)
        }
        
        addSelectedColorsToModel(color: FlagColors.option2.rawValue)
    }
    
    @IBAction func onTapOption3Btn(_ sender: UIButton) {
        
        if option3Btn.isSelected {
            
            option3Btn.isSelected = false
            self.option3Btn.backgroundColor = UIColor.lightGray
           
        } else {
            
            option3Btn.isSelected = true
              self.option3Btn.backgroundColor = UIColor(displayP3Red: 118/255, green: 189/255, blue: 50/255, alpha: 1.0)
        }
        
        addSelectedColorsToModel(color: FlagColors.option3.rawValue)
    }
    
    @IBAction func onTapOption4Btn(_ sender: UIButton) {
        
        if option4Btn.isSelected {
            
            option4Btn.isSelected = false
            self.option4Btn.backgroundColor = UIColor.lightGray
           
        } else {
            
            option4Btn.isSelected = true
              self.option4Btn.backgroundColor = UIColor(displayP3Red: 118/255, green: 189/255, blue: 50/255, alpha: 1.0)
        }
        
        addSelectedColorsToModel(color: FlagColors.option4.rawValue)
    }

    /* on clicking Next Button It will check weather selected values is there or not. If selected values is there it will assign to model and navigate to next screen
     */

    @IBAction func onTapNextBtn(_ sender: UIButton) {
     
        let sVc = SummaryViewController.getInstance()
        sVc.gameModel = gameModel
        navigationController?.pushViewController(sVc, animated: true)
    }
    
}
