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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "returnHome" {
            let showSplashScreen:ViewController = segue.destinationViewController as! ViewController
        }
    }

    @IBAction func toggleTF(tfSwitch: UISwitch) {
        var guess: Bool
        if tfSwitch.on {
            guess = false
            switchState.text = "You are guessing false."
        } else {
            guess = true
            switchState.text = "You are guessing true."
        }
        game.currentValue = guess
    }
    
    @IBAction func submitAnswer(sender: AnyObject) {
        //set values in game
        //check those values for win/loss
        if game.round == 5 {
            score.text = "\(game.numCorrect.description) / \(game.round.description) correct"
            generateDoneAlert()
        } else {
            generateQuizAlert()
        }
        
    }
    
    func generateDoneAlert() {
        var title = game.determineTitle()
        var message = game.generateMessage()
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "all done!", style: .Default, handler: {
                action in self.performSegueWithIdentifier("returnHome", sender: self)
            })
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func generateQuizAlert() {
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
        round.text = "Question \(game.round.description)"
        score.text = "\(game.numCorrect.description) / \(game.round.description) correct"
        
        drawNewFact()
    }
    
    func startNewRound() {
        game.calculateScore()
        drawNewFact()
        game.startNewRound()
    }
    
    func drawNewFact() {
        if let flashcard = factDict.drawRandomFact() {
            self.fact = flashcard
            questionLabel.text = flashcard.factStatement
            answerLabel.text = flashcard.factReality.description
            game.targetValue = flashcard.factReality
        }
    }
    
}