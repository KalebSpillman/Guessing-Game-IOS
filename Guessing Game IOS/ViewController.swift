//
//  ViewController.swift
//  Guessing Game IOS
//
//  Created by Kaleb Spillman on 10/9/18.
//  Copyright © 2018 Kaleb Spillman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var guesses = 5
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var guessRemainingLabel: UILabel!
    
 
    @IBOutlet weak var playAgainButton: UIButton!
    
    var minimum = 1
    var maximum = 100
    var numberOfGuesses = 5
    var randomNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomNumber =  Int.random(in: minimum ... maximum)
       instructionsLabelText.text = " please enter a number between \(minimum) and \(maximum)"
    }
    
    
    func makeAGuess() {
        
        
        //disable input
        guessTextField.isEnabled = false
        
        //Hide guess button
        guessButton.isHidden = true
        
        // unhide play again button
        playAgainButton.isHidden = false
        
        
    }
    @IBOutlet weak var instructionsLabelText: UILabel!
    
    
    
    
    
    
    
    @IBAction func playAgainButton(_ sender: Any) {
        restart()
    }
    func setUpForRestart() {
        
    }
    func restart() {
        // new random number
        randomNumber = Int.random(in: minimum ... maximum)
        
        // reset guesses remaining
        guesses = numberOfGuesses
        
        //clear text field
        guessTextField.text = ""
        
        //enable text field
        guessTextField.isEnabled = true
        
        //hide play again button
        playAgainButton.isHidden = true
        
        // show guess button
        guessButton.isHidden = false
        
        //reset feedback label
        feedbackLabel.text = "guess again 🤡"
        
        //reset guesses remaining label
        guessRemainingLabel.text = "you have 5 gusses remaining 🖐"
        
    }
    @IBAction func guessButtonTapped(_ sender: Any) {
        
        var counter = 0
        guessRemainingLabel.text = "\(guesses) guesses remaining"
        
        let userInput = guessTextField.text!
        
        guard  let guess = Int(userInput) else {
            feedbackLabel.text = "you didnt give me a number 👿"
            return
        }
        guard guess >= 1 && guess <= 100 else {
            feedbackLabel.text = "your number wasnt between 1 and 100 🤮"
            return
        }
        
        
        if guess == randomNumber  {
            makeAGuess()
            feedbackLabel.text = "You win 🥇"
            setUpForRestart()
            return
            
            
        }
        if guess != randomNumber && guesses == 0 {
            makeAGuess()
            feedbackLabel.text = "You lose 🤣"
            setUpForRestart()
            return
            
        }
        
        if guess < randomNumber {
            counter += 1
            guesses -= 1
            feedbackLabel.text = "Guess higher 🖕🏿"
        } else {
            counter += 1
            guesses -= 1
            feedbackLabel.text = "Guess lower 👎🏿"
        }
        
    }
    
}
