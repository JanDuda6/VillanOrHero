//
//  ScoreViewController.swift
//  PokeWars
//
//  Created by Kurs on 03/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {


    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: false)
    }
}
