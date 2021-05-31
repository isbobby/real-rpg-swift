//
//  DebugViewController.swift
//  Real RPG
//
//  Created by Leipetus  Hood  on 26/5/21.
//

import UIKit

class DebugViewController: UIViewController {
    // SqliteApi().insertTask(character_id: 1, experience: 1, description: "Sample Task", complete_time: Date())
    
    
    @IBAction func debugOneOnPress(_ sender: Any) {
        let characterList: [PlayerCharacter] = SqliteApi().getAllCharacters()
        
        for i in 0...(characterList.count - 1) {
            print(characterList[i].id!)
            print(characterList[i].class_name!)
            print(characterList[i].experience!)
        }
    }
    
    @IBAction func debugTwoOnPress(_ sender: Any) {
        SqliteApi().deleteCharacterById(character_id: 3)
        SqliteApi().deleteCharacterById(character_id: 4)
        SqliteApi().deleteCharacterById(character_id: 5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
