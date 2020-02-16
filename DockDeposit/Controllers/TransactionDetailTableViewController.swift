//
//  CreateTransactionTableViewController.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/15/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import UIKit

class TransactionDetailTableViewController: UITableViewController {
    
    private let placeholders = ["phone number", "start date", "location"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(TransactionDetailTableViewController.save))
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
        if indexPath.row < 3 {
            guard let textCell = tableView.dequeueReusableCell(withIdentifier: "\(TextFieldCell.self)", for: indexPath) as? TextFieldCell else {
                fatalError()
            }
            textCell.textField.placeholder = placeholders[indexPath.row]
            return textCell
        }
        else {
            guard let mapCell = tableView.dequeueReusableCell(withIdentifier: "\(MapCell.self)", for: indexPath) as? MapCell else {
                fatalError()
            }
            
           return mapCell
        }
    }
    
    @objc func save() {
        
        navigationController?.popViewController(animated: true)
    }
}
