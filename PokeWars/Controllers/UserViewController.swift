//
//  UserViewController.swift
//  PokeWars
//
//  Created by Kurs on 02/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {


    override func viewDidLoad() {
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
