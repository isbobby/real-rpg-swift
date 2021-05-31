//
//  CharacterCreationViewController.swift
//  Real RPG
//
//  Created by Liu Tong Tong on 5/31/21.
//

import UIKit
import SQLite3

class CharacterCreationViewController: UIViewController {
    
    @IBAction func createOnPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelOnPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
