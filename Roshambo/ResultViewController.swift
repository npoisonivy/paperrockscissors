//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Nikki L on 9/14/16.
//  Copyright © 2016 Nikki. All rights reserved.
//

import UIKit


class ResultViewController: UIViewController {
    
    var message: String?  // prepare being passed from PlayVC
    var image: UIImage?

    
    @IBOutlet weak var resultImage: UIImageView!  // on MSB, it's type is "UIImageView"
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("ResultVC showed up!")
        
        // change resultImage (outlet) to  -
        
        resultImage.image = UIImage(named:showImage())
        print(showImage())

        //        showImage()
        
        // change resultLabel to "xxxx" - what message is passed from PlayVC
        resultLabel.text = message
    }
    
    @IBAction func playAgain(){
        // dismiss current view back to PlayVC
        self.dismissViewControllerAnimated(true, completion: nil)
        print("Play again pressed")
    }
    
    // decide what img to show -> return imageName
    func showImage() -> String {
        var imageName: String!
        print("message here is \(message)")
        if message == "Rock crushes scissors, you win!" || message == "Rock crushes scissors, you lost!" {
            imageName = "RockCrushesScissors"
        } else if message == "Paper covers Rock, you win!" || message == "Paper covers Rock, you lost!" {
            imageName = "PaperCoversRock"
        } else if message == "It's A Tie!!!" {
            imageName = "itsATie"
        }
        else
        {
            imageName = "ScissorsCutPaper"
        }
        return imageName
    }
    


}
