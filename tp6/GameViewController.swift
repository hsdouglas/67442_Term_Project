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
    
    override func viewDidLoad() {
        questionLabel.text = "false"
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
}
