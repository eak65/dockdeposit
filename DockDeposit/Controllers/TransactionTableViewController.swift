//
//  TransactionTableViewController.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/15/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import UIKit

class TransactionTableViewController: UITableViewController {

    override func awakeFromNib() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(TransactionTableViewController.create))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TransactionCell.self)", for: indexPath) as? TransactionCell else {
                 fatalError()
             }
        
        cell.action_ButtonBottom = { [weak self] button in
            guard let wSelf = self else {
                return
            }
            wSelf.action_ButtonBottom(indexPath: indexPath, button: button)
        }

        return cell
    }
    @objc func create() {
    navigationController?.pushViewController(ControllerFactory().createTransactionDetailTableViewController(), animated: true)
        
    }
    func action_ButtonBottom(indexPath: IndexPath, button: UIButton) {
        
    }
}
