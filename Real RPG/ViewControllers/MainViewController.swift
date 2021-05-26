//
//  LandingViewController.swift
//  Real RPG
//
//  Created by Leipetus  Hood  on 26/5/21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func questButtonOnPress(_ sender: Any) {
        performSegue(withIdentifier: "MainToQuest", sender: self)
    }
    
    @IBAction func characterButtonOnPress(_ sender: Any) {
        performSegue(withIdentifier: "MainToCharacter", sender: self)
    }
    
    @IBAction func progressButtonOnPress(_ sender: Any) {
        performSegue(withIdentifier: "MainToProgress", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
