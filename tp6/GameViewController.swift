//
//  GameViewController.swift
//  
//
//  Created by Hannah Stucken Douglas on 12/8/15.
//
//

import UIKit

class GameViewController: UIViewController {
    
    /* initialize a game and facts for that game */
    var game = Game()
    let factDict = Factdeck()
    var fact: Factoid?

    @IBOutlet weak var tfSwitch: UISwitch!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var score: UILabel!
    
    override func viewDidLoad() {
        game.startNewGame()
        updateLabels()
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        /* guide the user out of the quiz naturally, to maintain sense of "microtasking" */
        if segue.identifier == "returnHome" {
            let showSplashScreen:ViewController = segue.destinationViewController as! ViewController
        }
    }

    /* store the value of the switch */
    @IBAction func toggleTF(tfSwitch: UISwitch) {
        var guess: Bool
        /* need to store opposite values, because user testing showed reversed mental models */
        if tfSwitch.on {
            guess = false
        } else {
            guess = true
        }
        game.currentValue = guess
    }
    
    /* queue up feedback for user based on their input */
    @IBAction func submitAnswer(sender: AnyObject) {
        /* games are only 5 rounds to solve the "I'm bored" user model */
        if game.round == 5 {
            generateAlert(true)
        } else {
            generateAlert(false)
        }
        
    }
    
    /* user feedback showed that users wanted to click on the labels to toggle the switch */
    @IBAction func toggleToTrue(sender: AnyObject) {
        tfSwitch.setOn(false, animated: true)
    }

    /* user feedback showed that users wanted to click on the labels to toggle the switch */
    @IBAction func toggleToFalse(sender: AnyObject) {
        tfSwitch.setOn(true, animated: true)
    }

    /* customize the alert message based on the user's progression through the game */
    func generateAlert(gameOver: Bool) {
        var title = game.determineTitle()
        var message = game.generateMessage()
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        /* if the game is over, take the user back to the homepage */
        if gameOver == true {
            let action = UIAlertAction(title: "All Done!", style: .Default, handler: {
                action in self.performSegueWithIdentifier("returnHome", sender: self)
            })
            alert.addAction(action)
        /* else, the game continues with the next round */
        } else {
            let action = UIAlertAction(title: "ok", style: .Default, handler: { action in
                self.startNewRound()
                self.updateLabels()
            })
            alert.addAction(action)
        }
        
        presentViewController(alert, animated: true, completion: nil)
    }

    /* provide the user with feedback about their score so they are encouraged to learn */
    func updateLabels() {
        round.text = "Question \(game.round.description) out of 5"
        score.text = "\(game.numCorrect.description) correct so far"
        drawNewFact()
    }
    
    /* send the game object data to calculate user feedback */
    func startNewRound() {
        game.calculateNumCorrect()
        drawNewFact()
        game.startNewRound()
    }
    
    /* get a random fact from the factdeck to show to the user */
    func drawNewFact() {
        if let flashcard = factDict.drawRandomFact() {
            self.fact = flashcard
            questionLabel.text = flashcard.factStatement
            game.targetValue = flashcard.factReality
        }
    }
    
}