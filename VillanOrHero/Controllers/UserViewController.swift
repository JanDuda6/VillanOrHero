//
//  UserViewController.swift
//  MarvelVillanOrHero
//
//  Created by Kurs on 02/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var errorMessage: UILabel!
    @IBOutlet weak var startButton: UIButton!

    var questionManager = QuestionManager.sharedInstance

    override func viewDidLoad() {
        userNameTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @IBAction func startButtonPressed(_ sender: UIButton) {
        checkTextFieldName()
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
}
//MARK: - Text Field Delegate
extension UserViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkTextFieldName()

        textField.resignFirstResponder()
        return true
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    func checkTextFieldName() {
        if let userName = userNameTextField.text {
            if questionManager.checkUserName(userName: userName) {
                questionManager.userName = userName
                performSegue(withIdentifier: Constants.questionVCSegue, sender: self)
            } else {
                errorMessage.text = "Name is already taken"
            }
        }
        if userNameTextField.text?.isEmpty == true{
            errorMessage.text = "Enter your name"
        }
    }
}
