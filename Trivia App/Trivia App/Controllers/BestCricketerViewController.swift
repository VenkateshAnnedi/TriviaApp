//
//  BestCricketerViewController.swift
//  Trivia App
//
//  Created by Venkat on 29/05/20.
// Copyright @ 2020 Venkat. All rights reserved.
//

import UIKit

class BestCricketerViewController: UIViewController {

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
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
    
    static func getInstance() -> BestCricketerViewController {
        
        let sb = UIStoryboard(name: SB.main, bundle: nil)
        return sb.instantiateViewController(withIdentifier: VC.bestCricketer) as! BestCricketerViewController
    }
    
    // Setting Options from the SportsPersons enum

    func setUpUI() {
        
        self.option1Btn.setTitle(SportsPersons.option1.rawValue, for: .normal)
        self.option2Btn.setTitle(SportsPersons.option2.rawValue, for: .normal)
        self.option3Btn.setTitle(SportsPersons.option3.rawValue, for: .normal)
        self.option4Btn.setTitle(SportsPersons.option4.rawValue, for: .normal)
        self.nextBtn.isUserInteractionEnabled = false
        self.nextBtn.alpha = 0.6
    }
    
    /* Method is used to select clear all selections before selcting a new one */
    
    func deselectAllOptions() {
        
        self.nextBtn.alpha = 1.0
        self.nextBtn.isUserInteractionEnabled = true
        self.option1Btn.isSelected = false
        self.option2Btn.isSelected = false
        self.option3Btn.isSelected = false
        self.option4Btn.isSelected = false
        self.option1Btn.backgroundColor = UIColor.lightGray
        self.option2Btn.backgroundColor = UIColor.lightGray
        self.option3Btn.backgroundColor = UIColor.lightGray
        self.option4Btn.backgroundColor = UIColor.lightGray
    }
    
    //MARK: - IB Actions
    
    @IBAction func onTapOption1Btn(_ sender: UIButton) {
        
        deselectAllOptions()
        self.option1Btn.isSelected = true
        self.option1Btn.backgroundColor = UIColor(displayP3Red: 118/255, green: 189/255, blue: 50/255, alpha: 1.0)
        gameModel.cricketerName = SportsPersons.option1.rawValue
    }
    
    @IBAction func onTapOption2Btn(_ sender: UIButton) {
        
        deselectAllOptions()
        self.option2Btn.isSelected = true
        self.option2Btn.backgroundColor = UIColor(displayP3Red: 118/255, green: 189/255, blue: 50/255, alpha: 1.0)
        gameModel.cricketerName = SportsPersons.option2.rawValue
    }
    
    @IBAction func onTapOption3Btn(_ sender: UIButton) {
        
        deselectAllOptions()
        self.option3Btn.isSelected = true
        self.option3Btn.backgroundColor = UIColor(displayP3Red: 118/255, green: 189/255, blue: 50/255, alpha: 1.0)
        gameModel.cricketerName = SportsPersons.option3.rawValue
    }
    
    @IBAction func onTapOption4Btn(_ sender: UIButton) {
        
        deselectAllOptions()
        self.option4Btn.isSelected = true
        self.option4Btn.backgroundColor = UIColor(displayP3Red: 118/255, green: 189/255, blue: 50/255, alpha: 1.0)
        gameModel.cricketerName = SportsPersons.option4.rawValue
    }
    
    /* on clicking Next Button It will check weather selected value is there or not. If selected value is there it will assign to model and navigate to next screen
     */

    @IBAction func onTapNextBtn(_ sender: UIButton) {
        
        let nfVc = NationalFlagViewController.getInstance()
        nfVc.gameModel = gameModel
        navigationController?.pushViewController(nfVc, animated: true)
    }
}
