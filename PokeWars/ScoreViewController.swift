//
//  ScoreViewController.swift
//  PokeWars
//
//  Created by Kurs on 01/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        scoreLabel.text = "Your score: "
    }

    

}
