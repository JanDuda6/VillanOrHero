//
//  ViewController.swift
//  PokeWars
//
//  Created by Kurs on 27/08/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var a = CharacterManager()
    
    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        a.fetchCharacter()
    }



}


