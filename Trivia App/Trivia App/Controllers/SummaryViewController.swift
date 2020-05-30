//
//  SummaryViewController.swift
//  Trivia App
//
//  Created by Venkat on 29/05/20.
// Copyright @ 2020 Venkat. All rights reserved.
//

import UIKit
import CoreData

class SummaryViewController: UIViewController {
    
    var gameModel = Game()
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var bestCricketerLbl: UILabel!
    @IBOutlet weak var selectedColorsLbl: UILabel!
    
    @IBOutlet weak var finishBtn: UIButton!

    //MARK: - UIView Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getSummary()
    }
    
    static func getInstance() -> SummaryViewController {
        
        let sb = UIStoryboard(name: SB.main, bundle: nil)
        return sb.instantiateViewController(withIdentifier: VC.summary) as! SummaryViewController
    }
    
    /*  updating screen with the model which user selected in previous screens
     */
    func getSummary(){
        
        self.selectedColorsLbl.text = gameModel.flagColors?.joined(separator: ",")
        self.bestCricketerLbl.text = gameModel.cricketerName
        self.userNameLbl.text = "Hello : \(gameModel.userName ?? "Name")"
        
        selectedColorsLbl.textColor  = UIColor.blue
        bestCricketerLbl.textColor  = UIColor.blue
        userNameLbl.textColor  = UIColor.blue
    }
    
    /* Saving data into local db i.e coredata
     After successfull saving, the game will start again
     */
    
    func saveDataIntoLocalDB() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM h:mm a"
        let date = formatter.string(from: Date())
        print("Current Date : \(date)")
        
        let context = (CoredataManager.sharedManager).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Game", in: context)
        let game = NSManagedObject(entity: entity!, insertInto: context)
        game.setValue(gameModel.userName, forKey: "userName")
        game.setValue(gameModel.cricketerName, forKey: "cricketerName")
        game.setValue(gameModel.flagColors, forKey: "flagColors")
        game.setValue("\(date)", forKey: "createdDate")
        
        do {
            try context.save()
            
        } catch {
            print("Failed : \(ALERT.error_saving)")
            UIAlertController.showAlert(vc: self, title: ALERT.title, message: ALERT.error_saving)
        }
    }
    
    //MARK: - IB Actions
    
    @IBAction func onTapFinishBtn(_ sender: UIButton) {
        
        /* Clearing values from game model after completion game
         => for that we are getting the NameViewController and we are clearing that model
         */
        saveDataIntoLocalDB()
        
        DispatchQueue.main.async {
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: NameViewController.self) {

                    if controller is NameViewController {
                        let viewVc = controller as! NameViewController
                        viewVc.gameModel = Game()
                    }

                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
        }
    }
}
