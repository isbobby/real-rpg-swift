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
//        SqliteApi().insertCharacter(class_name: "Da Vinci",  experience: 0)
        SqliteApi().getAllCharacters()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
