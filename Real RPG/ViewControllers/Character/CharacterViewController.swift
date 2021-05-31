//
//  CharacterViewController.swift
//  Real RPG
//
//  Created by Leipetus  Hood  on 26/5/21.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createOnPress(_ sender: Any) {
        performSegue(withIdentifier: "CharacterToCharacterCreation", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
