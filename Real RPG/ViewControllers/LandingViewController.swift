//
//  ViewController.swift
//  Real RPG
//
//  Created by Leipetus  Hood  on 26/5/21.
//

import UIKit

class LandingViewController: UIViewController {
    @IBOutlet weak var HelloSirLabel: UILabel!
    @IBOutlet weak var LoadingLabel: UILabel!
    @IBOutlet var LandingView: UIView!
    @IBOutlet weak var ViewButton: UIButton!
    
    @IBAction func ViewOnPress(_ sender: Any) {
        performSegue(withIdentifier: "ToMainInterfaceSegue", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

