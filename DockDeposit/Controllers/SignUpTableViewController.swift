//
//  SignUpTableViewController.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/15/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import UIKit

class SignUpTableViewController: UITableViewController {

    let placeHolder = ["First Name", "Last Name", "Email", "Password"]
    private let sbf = ControllerFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(SignUpTableViewController.action_buttonNext))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(SignUpTableViewController.action_buttonCancel))

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TextFieldCell.self)", for: indexPath) as? TextFieldCell else {
            fatalError()
        }
        cell.textField.placeholder = placeHolder[indexPath.row]
    
        return cell
    }
    
    @objc func action_buttonNext() {
        self.navigationController?.pushViewController(sbf.createPhoneVerificationViewController(), animated: true)
    }
    
    @objc func action_buttonCancel() {
        dismiss(animated: true, completion: nil)
    }
}
