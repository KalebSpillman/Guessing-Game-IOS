//
//  SelectDifficultyViewController.swift
//  Guessing Game IOS
//
//  Created by Kaleb Spillman on 10/11/18.
//  Copyright © 2018 Kaleb Spillman. All rights reserved.
//

import UIKit

class selectDifficultyViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let viewController = segue.destination as? ViewController else
        { return }
        
        switch segue.identifier {
        case "easy":
            viewController.maximum = 50
            
        case "medium":
            viewController.maximum = 75
           
        case "hard":
            viewController.maximum = 100
            
        default: break
        }
        
       
        
    }
}
