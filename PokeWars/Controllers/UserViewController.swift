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
    @IBOutlet weak var errorMessage: UILabel!
    
    var questionManager = QuestionManager.sharedInstance

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

            if questionManager.checkUserName(userName: userName) {
                questionManager.userName = userName
                textField.resignFirstResponder()
                performSegue(withIdentifier: Constants.questionVCSegue, sender: self)

            } else {
                errorMessage.text = "Name is already taken"
            }

        } else {
            errorMessage.text = "Enter your name"
        }
        return true
    }
}
