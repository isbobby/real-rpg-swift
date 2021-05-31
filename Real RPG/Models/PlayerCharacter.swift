//
//  PlayerCharacter.swift
//  Real RPG
//
//  Created by Liu Tong Tong on 5/31/21.
//

import Foundation

class PlayerCharacter {
    var id: Int?
    var class_name: String?
    var experience: Int?
    
    let LEVEL_1 = 2
    let LEVEL_2 = 5
    let LEVEL_3 = 12
    let LEVEL_4 = 20
    let LEVEL_5 = 32
    let LEVEL_6 = 45
    
    func calculateLevel() -> Int {
        // todo use self.experience to calculate level
        return 0
    }
    
    func progressBarPercentage() -> Float {
        // todo use self.experience to calculate percentage bar
        return 0.0
    }
}
