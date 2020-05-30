//
//  NameViewController.swift
//  Trivia App
//
//  Created by Venkat on 29/05/20.
// Copyright @ 2020 Venkat. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {

    var gameModel = Game()

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var historyBtn: UIBarButtonItem!
    
    //MARK: - UIView Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        setUpGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        if let name = gameModel.userName {
            
            self.nameTF.text = name
            
        } else {
            
            self.nameTF.text = ""
        }
    }
        
    func setUpUI() {
        
        nextBtn.uiButtonCornerRadius(radius: nextBtn.layer.frame.size.height / 2)
    }
    
    func setUpGesture() {
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }

    //MARK: - IB Actions
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        hideKeyBoard()
    }
    
    /* on clicking History Button It will check weather history is there or not in the Next screen. If history data is there it will display in tableview
     */

    @IBAction func onTapHistoryBtn(_ sender: UIBarButtonItem) {
        
        let hVc = HistoryViewController.getInstance()
        let navigationController = UINavigationController(rootViewController: hVc)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }

    /* on clicking Next Button It will check weather text is there or not. If text is there it will assign to model and navigate to next screen
     */

    @IBAction func onTapNextBtn(_ sender: UIButton) {
        
        if nameTF.hasText {
            
            hideKeyBoard()
            gameModel.userName = nameTF.text

            let bcVc = BestCricketerViewController.getInstance()
            bcVc.gameModel = gameModel
            navigationController?.pushViewController(bcVc, animated: true)
            
        } else {
            
            UIAlertController.showAlert(vc: self, title: ALERT.title, message: ALERT.enter_Name)
        }
    }
}

extension NameViewController {
    
    func hideKeyBoard() {
        
        view.endEditing(true)
    }
}

//MARK: UITextField Delegate

extension NameViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }

}
