//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Nikki L on 9/14/16.
//  Copyright © 2016 Nikki. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
//    var userChoice:String!
    var userChoice: String!
    var phoneChoice:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("resetting self.userChoice as nil")
    }
    
    // add prepareSegue after performSegue - Scissor (segue only + prepare segue) , paper (segue + performSegue + prepareSegue)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 1. tell VC where is destination VC
        let controller = segue.destinationViewController as! ResultViewController
        
        if segue.identifier == "paper" {
            // 2. what to pass?
            controller.message = getMessage()
            print(controller.message)
        } else if segue.identifier == "scissors" {
            self.userChoice = "scissors"
            controller.message = getMessage()
        }
    }
    
    // paper - code + segue 
    // code - should be triggered by IB Action
    @IBAction func paper_button() {
        print("paper button pressed")
        self.userChoice = "paper"
        // should set up segue id, link PlayVC to REsultVC, then should have something to call segue here below.
        // prepareSegue (outside this func) -> add user's choice = paper, below write performSegue -> when paper butotn is pressed, then call up segue ID xxx -> then it will find the matching ID at self (PlayVC) -> found as there is a link from PlayVC - ResultVC already
        
       
//        print(compare())
//        print(getMessage())

        //message = getMessage() -> then pass this message as controller.message to next ResultVC, make sure add var at ResultVC
        
//        send to compare func and decide what label to show !
        // performSegue
        performSegueWithIdentifier("paper", sender: self) // self= where are u going to look for "pickPaper" - PlayVC segue listing
        
        // to pass data from current VC to next, u need prepareSegue func!
        
        }

    
    // rock - code only, no MSB interface required - NO SEGUE needed
    @IBAction func rock_button(){
        print("userChoice is \(self.userChoice) before ")
        self.userChoice = "rock"
        
        print("rock button pressed")
//        print(compare())
        
        var controller:ResultViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        // involve MSB with code
        
        
        // pass message to controller as well
        controller.message = getMessage()

//        print("answer is /(getMessage())")
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    // scissors - no code except for prepareForSegue func!
    @IBAction func scissors_button(){
        // empty
    }
    
    // need to write some method:
    func phoneDraws() -> String {
        let selection = ["scissors", "paper", "rock"]
        let index = Int(arc4random_uniform(UInt32(selection.count)))
        return selection[index]
    }
    
    // below func is called when compare() is called
//    problem - error - optional binding... have no idea how to fix this!
//    func userPhone(sender: UIButton) -> String{
//        // grab label's title
//        let button = sender as UIButton // button is optional now, so need to unwrap it first
//        if let buttonTitle = button.currentTitle {
//            return String(UTF8String: buttonTitle)!
//        }
//    }

//    self.phoneChoice
//    print(phoneDraws())
    func compare() -> String {
        print("compare() is called")
        // call helper func here - to get userChoice...  - no need to hardcode scissor/ paper/ rock when user press the button anymore
        self.phoneChoice = self.phoneDraws()
        // make sure u have the userChoice set up before here.
        
        print("@ compare (), Phone's choice is \(self.phoneChoice)")
        print("User's choice is \(self.userChoice)")
        // compare self.phoneChoice and self.userChoice
        switch self.userChoice {
            case "rock":
                if self.phoneChoice == "paper" {
                    return "phone"}
                else if self.phoneChoice == "scissors" {
                    return "user"}
                else {
                    return "tie"}
            case "paper":
                if self.phoneChoice == "rock" {
                    return "user"}
                else if self.phoneChoice == "scissors" {
                    return "phone"}
                else {
                    return "tie"}
            case "scissors":
                if self.phoneChoice == "rock" {
                    return "phone"}
                else if self.phoneChoice == "paper" {
                    return "user"}
                else {
                    return "tie"}
            default:
                return "error"
        }
    
    }
    
    func getMessage() -> String {

        var winner:String!
        var message:String! // if I don't put optional ex: var message:String, error - Var "message" used before being initialized
        print("getMessage() is called!")
        winner = compare()  // return, tie, user, phone
        // compare what winner and self.userChoice is...
        if winner == "tie" {
            message = "It's A Tie!!!"
        }
        else if winner == "user" {
            switch self.userChoice {
                case "rock":
                    message = "Rock crushes scissors, you win!"

                case "paper":
                    message = "Paper covers Rock, you win!"
                
                case "scissors":
                    message = "Scissors cut paper, you win!"
                
                default:
                    message = "error"
            }
        }
        else if winner == "phone" {
            switch self.phoneChoice {
                case "rock":
                    message = "Rock crushes scissors, you lost!"
                
                case "paper":
                    message = "Paper covers Rock, you lost!"
                
                case "scissors":
                    message = "Scissors cut paper, you lost!"
                
                default:
                    message = "error"
            }
        }
    
        return message
    }
}










