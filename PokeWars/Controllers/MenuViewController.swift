//
//  MenuViewController.swift
//  PokeWars
//
//  Created by Kurs on 02/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var topScoreButton: UIButton!

    @IBAction func buttonPressed(_ sender: UIButton) {

        if sender.titleLabel == newGameButton.titleLabel {
            performSegue(withIdentifier: Constants.userVCSegue, sender: self)

        } else {
            performSegue(withIdentifier: Constants.topScoresVCSegue, sender: self)
        }
    }
}
