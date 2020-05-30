//
//  UIAlertController+Extensions.swift
//  Trivia App
//
//  Created by Venkat on 29/05/20.
// Copyright @ 2020 Venkat. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    class func showAlert(vc:UIViewController,title:String,message:String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        vc.present(alertController, animated: true)
    }
}
