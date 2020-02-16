//
//  ViewController.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/15/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    private let storyBoardFactory = ControllerFactory()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func action_loginButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

