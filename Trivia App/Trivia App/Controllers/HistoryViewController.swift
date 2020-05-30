//
//  HistoryViewController.swift
//  Trivia App
//
//  Created by Venkat on 29/05/20.
// Copyright @ 2020 Venkat. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {

    var arrayOfGames = [Game]()

    @IBOutlet weak var historyTblVw: UITableView!
    @IBOutlet weak var noDataLbl: UILabel!
    
    //MARK: - UIView Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpUI()
    }
    
    func setUpUI() {
        
        navigationItem.title = NAV_TITLE.history
        
        noDataLbl.isHidden = true
        historyTblVw.isHidden = true
        
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(onTapCancel))
        navigationItem.leftBarButtonItem = cancelBtn
        
        getDataFromLocalDB()
        self.historyTblVw.delegate = self
        self.historyTblVw.dataSource = self
    }
    
    static func getInstance() -> HistoryViewController {
        
        let sb = UIStoryboard(name: SB.main, bundle: nil)
        return sb.instantiateViewController(withIdentifier: VC.history) as! HistoryViewController
    }
    
    /* getting data from local db */
    func getDataFromLocalDB() {
        
        let context = (CoredataManager.sharedManager).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            let jsonArray = convertToJSONArray(array: result as! [NSManagedObject])
            // getting models array from Game Model
           arrayOfGames = Game.modelsFromDictionaryArray(array: jsonArray as NSArray)
            if arrayOfGames.count > 0{
                historyTblVw.isHidden = false
                self.historyTblVw.reloadData()
            } else {
                noDataLbl.isHidden = false
            }
        } catch {
            print("Failed : \(ALERT.error_getting)")
            UIAlertController.showAlert(vc: self, title: ALERT.title, message: ALERT.error_getting)
        }
    }
    
    /* Converting Array of NSManagedObjects to JSON Array */
    func convertToJSONArray(array: [NSManagedObject]) -> [[String:Any]] {
        var jsonArray: [[String: Any]] = []
        for item in array {
            var dict: [String: Any] = [:]
            for attribute in item.entity.attributesByName {
                //check if value is present, then add key to dictionary so as to avoid the nil value crash
                if let value = item.value(forKey: attribute.key) {
                    dict[attribute.key] = value
                }
            }
            jsonArray.append(dict)
        }
        return jsonArray
    }

    //MARK: - IB Actions
    
    @objc func onTapCancel() {
        
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - UITableview DataSource

extension HistoryViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  =  tableView.dequeueReusableCell(withIdentifier: HostoryTableViewCell.identifier) as! HostoryTableViewCell
        let game = arrayOfGames[indexPath.row]
        
        // loading cell with the game model
        cell.setupCell(game: game, index: indexPath.row)

        return cell
    }

}

