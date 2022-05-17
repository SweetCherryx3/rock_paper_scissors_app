//
//  ViewController.swift
//  iOSFInalProject
//
//  Created by Daniel Santos-Martinez on 5/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    // set UILabels and UIImageViews
    @IBOutlet var userScore: UILabel!
    @IBOutlet var computerScore: UILabel!
    @IBOutlet var tieLabel: UILabel!
    @IBOutlet var yourHandChoice: UIImageView!
    @IBOutlet var computerHandChoice: UIImageView!
    
    // these will show the output/choice the user and computer chose
    @IBOutlet var outputUser: UILabel!
    @IBOutlet var outputComputer: UILabel!
    
    // this UILabel will show to the user who beat who
    @IBOutlet var equalitySign: UILabel!
    
    // declaring variables and constants in use for the game to work
    var userChoice:String = ""
    var computer:String = ""
    let rock:String = "Rock"
    let scissors:String = "Scissors"
    let paper:String = "Paper"
    let hands:[String] = ["Rock", "Paper", "Scissors"]
    var userScore2:Int = 0
    var computerScore2:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // the result function to decide who wins and loses each round
    func result (){
        if userChoice == computer{
            tieLabel.text = "Tie"
            equalitySign.text = "="
            yourHandChoice.image = computerHandChoice.image
        } else if userChoice == rock {
            yourHandChoice.image = UIImage(named:"the rock")
            if computer == scissors{
                userScore2 += 1
                scoreBoard()
                tieClear()
                equalitySign.text = ">"
                computerHandChoice.image = UIImage(named:"scissors")
            } else {
                computerScore2 += 1
                scoreBoard()
                tieClear()
                equalitySign.text = "<"
                computerHandChoice.image = UIImage(named:"paper")
            }
        } else if userChoice == paper {
            yourHandChoice.image = UIImage(named:"paper")
            if computer == rock{
                userScore2 += 1
                scoreBoard()
                tieClear()
                equalitySign.text = ">"
                computerHandChoice.image = UIImage(named:"the rock")
            } else {
                computerScore2 += 1
                scoreBoard()
                tieClear()
                equalitySign.text = "<"
                computerHandChoice.image = UIImage(named:"scissors")
            }
            
        } else if userChoice == scissors {
            yourHandChoice.image = UIImage(named:"scissors")
                if computer == paper{
                    userScore2 += 1
                    scoreBoard()
                    tieClear()
                    equalitySign.text = ">"
                    computerHandChoice.image = UIImage(named:"paper")
                } else {
                    computerScore2 += 1
                    scoreBoard()
                    tieClear()
                    equalitySign.text = "<"
                    computerHandChoice.image = UIImage(named:"the rock")
                }
        }
}
    
    // randomizes the computer's choice and what it chooses based on the elements of an array declared above
    func computerHand(){
        computer = hands.randomElement()!
        //print(computer)
    }
    
    // A scoreboard increase changes the UILabel for whoever scores a point
    func scoreBoard(){
        userScore.text = String(userScore2)
        computerScore.text = String(computerScore2)
    }
    
    // used in the reset button. Clears the scoreboard for a fresh start
    func clear(){
        userChoice = ""
        computer = ""
        userScore2 = 0
        computerScore2 = 0
        tieLabel.text = ""
        userScore.text = "0"
        equalitySign.text = "> or <"
        computerScore.text = "0"
        outputUser.text = "Your Hand"
        outputComputer.text = "Computer's Hand"
    }
    
    // makes the "Tie" string empty (if there is one) for the next round
    func tieClear(){
        tieLabel.text = ""
    }
    
    // user's choices/buttons rock, paper and scissor. Changes the UIImageView of the user's choice to what they choose in the new round. If tie for any of the choices, both UIImageView's for user and computer change to the same picture.
    
    @IBAction func rockBtn(_ sender: Any) {
        userChoice = rock
        computerHand()
        result()
        if userChoice == computer {
            yourHandChoice.image = UIImage(named:"the rock")
            computerHandChoice.image = UIImage(named:"the rock")
        }
    }
    
    @IBAction func scissorBtn(_ sender: Any){
        userChoice = scissors
        computerHand()
        result()
        if userChoice == computer {
            yourHandChoice.image = UIImage(named:"scissors")
            computerHandChoice.image = UIImage(named:"scissors")
        }
    }
    
    @IBAction func paperBtn(_ sender: Any) {
        userChoice = paper
        computerHand()
        result()
        if userChoice == computer {
            yourHandChoice.image = UIImage(named:"paper")
            computerHandChoice.image = UIImage(named:"paper")
        }
    }
    
    // restart button to clear the scoreboard
    @IBAction func restartBtn(_ sender: Any) {
        clear()
    }
}



