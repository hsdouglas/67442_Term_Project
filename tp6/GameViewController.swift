//
//  GameViewController.swift
//  
//
//  Created by Hannah Stucken Douglas on 12/8/15.
//
//

import UIKit

class GameViewController: UIViewController {
    
    let factDict = Factdeck()
    var fact: Factoid?

    @IBOutlet weak var tfSwitch: UISwitch!
    @IBOutlet weak var switchState: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var score: UILabel!
    
    var game = Game()
    
    override func viewDidLoad() {
        game.startNewGame()
        updateLabels()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleTF(tfSwitch: UISwitch) {
        if tfSwitch.on {
            switchState.text = "You are guessing TRUE"
        } else {
            switchState.text = "You are guessing FALSE"
        }
    }
    
    @IBAction func submitAnswer(sender: AnyObject) {
        //set values in game
        //check those values for win/loss
        generateAlert()
    }
    
    func generateAlert() {
        var title = game.determineTitle()
        var message = game.generateMessage()
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "ok", style: .Default, handler: { action in
            self.startNewRound()
            self.updateLabels()
        })
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func updateLabels() {
        questionLabel.text = game.question
        answerLabel.text = game.casting(game.targetValue)
        round.text = game.round.description
        score.text = game.score.description
        
        if let flashcard = factDict.drawRandomFact() {
            self.fact = flashcard
            questionLabel.text = flashcard.factStatement
        }
    }
    
    func startNewRound() {
        game.calculateScore()
        game.startNewRound()
    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        if let flashcard = factDict.drawRandomFact() {
//            self.fact = flashcard
//            questionLabel.text = flashcard.factStatement
//        }
//    }
    
}