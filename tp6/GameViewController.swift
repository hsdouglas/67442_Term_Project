//
//  GameViewController.swift
//  
//
//  Created by Hannah Stucken Douglas on 12/8/15.
//
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var tfSwitch: UISwitch!
    @IBOutlet weak var switchState: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    var game = Game()
    
    override func viewDidLoad() {
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
        var title = "Hello"
        var message = "This is where the message would appear"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "ok", style: .Default, handler: nil)
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func updateLabels() {
        questionLabel.text = game.question
        answerLabel.text = casting(game.targetValue.boolValue)
    }
    
    func casting(b: Bool) -> String {
        var statement: String
        
        if (b == true) {
            statement = "true"
        } else {
            statement = "false"
        }
        
        return statement
    }
}
