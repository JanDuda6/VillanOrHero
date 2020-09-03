//
//  UserViewController.swift
//  PokeWars
//
//  Created by Kurs on 02/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!

    var questionManager = QuestionManager()
    var user = User(name: "User")

    override func viewDidLoad() {
        userNameTextField.delegate = self
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
}
//MARK: - Text Field Delegate

extension UserViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if let userName = userNameTextField.text {
            user.name = userName
        }
        textField.resignFirstResponder()
        performSegue(withIdentifier: Constants.questionVCSegue, sender: self)
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let questionVC = segue.destination as? QuestionViewController {
        questionVC.user = user
        }
    }
}
