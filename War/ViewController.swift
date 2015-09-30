//
//  ViewController.swift
//  War
//
//  Created by Hines, Bobby M. on 6/23/15.
//  Copyright (c) 2015 Hines, Bobby M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var enemyScore: UILabel!
    
    var cardNamesArray:[String] = ["card1", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "card11", "card12", "card13"]
    var playerScoreTotal = 0
    var enemyScoreTotal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playRoundTapped(sender: UIButton) {
        
        // Randomize numbers for imageviews (casted as Int instead of UInt32)
        var firstRandomNumber:Int = Int(arc4random_uniform(13))
        var secondRandomNumber:Int = Int(arc4random_uniform(13))
        
        // Construct strings with the random numbers
        var firstCardString:String = self.cardNamesArray[firstRandomNumber]
        var secondCardString:String = self.cardNamesArray[secondRandomNumber]
        
        // Set the card image view to the asset corresponding to the randomized number
        self.firstCardImageView.image = UIImage(named: firstCardString)
        self.secondCardImageView.image = UIImage(named: secondCardString)
        
        // Determine the higher card
        if firstRandomNumber > secondRandomNumber {
            playerScoreTotal += 1
            self.playerScore.text = String(playerScoreTotal)
        } else if secondRandomNumber == firstRandomNumber {
            // TODO: Tie
        } else {
            enemyScoreTotal += 1
            self.enemyScore.text = String(enemyScoreTotal)
        }
    }
}
