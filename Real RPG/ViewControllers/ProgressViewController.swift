//
//  ProgressViewController.swift
//  Real RPG
//
//  Created by Leipetus  Hood  on 26/5/21.
//

import UIKit

class ProgressViewController: UIViewController {
    
    
    @IBAction func submitTaskOnPress(_ sender: Any) {
        let sqliteApi = SqliteApi()
        sqliteApi.insertTask(character_id: 1, experience: 1, description: "Test", complete_time: Date())
    }
    
    
    @IBAction func cancelOnPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sliderOnChange(_ sender: Any) {
        print("Slided")
    }
    
    @IBAction func descriptionEditDidEnd(_ sender: Any) {
        print("Slided")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}



