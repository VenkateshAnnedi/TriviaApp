//
//  Game.swift
//  Trivia App
//
//  Created by Venkat on 29/05/20.
// Copyright @ 2020 Venkat. All rights reserved.
//

import Foundation

public class Game {
    public var userName : String?
    public var cricketerName : String?
    public var createdDate : String?
    public var flagColors : Array<String>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Game] {
        
        var models:[Game] = []
        
        for item in array {
            
            models.append(Game(dictionary: item as! NSDictionary)!)
        }
        
        return models
    }

    required public init (){
        
    }
    
    required public init?(dictionary: NSDictionary) {

        userName = dictionary["userName"] as? String
        cricketerName = dictionary["cricketerName"] as? String
        createdDate = dictionary["createdDate"] as? String
        flagColors = dictionary["flagColors"]  as? Array<String>
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.userName, forKey: "userName")
        dictionary.setValue(self.cricketerName, forKey: "cricketerName")
        dictionary.setValue(self.createdDate, forKey: "createdDate")
        dictionary.setValue(self.flagColors, forKey: "flagColors")

        return dictionary
    }

}
