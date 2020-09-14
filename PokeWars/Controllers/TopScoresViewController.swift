//
//  TopScoresViewController.swift
//  PokeWars
//
//  Created by Kurs on 02/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class TopScoresViewController: UIViewController {

    @IBOutlet weak var score1: UILabel!

    let questionManager = QuestionManager.sharedInstance

    override func viewDidLoad() {
        if let topScore = questionManager.loadUserDefault()?.sorted(by: {$0.1 < $1.1}) {
            for scores in topScore {
                createLabel(with: "\(scores.key)    \(scores.value)")}

        } else {

            createLabel(with: "Empty")
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    func createLabel(with text: String) {
        let targetLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        targetLabel.backgroundColor = .white
        targetLabel.layer.masksToBounds = true
        targetLabel.layer.cornerRadius = 5
        targetLabel.text = text
        targetLabel.textAlignment = .center
        self.view.addSubview(targetLabel)
    }
}
