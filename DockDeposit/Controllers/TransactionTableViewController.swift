//
//  TransactionTableViewController.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/15/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import UIKit

class TransactionTableViewController: UITableViewController {
    
    var transactionModelViews = [TransactionTableModelView]()
    
    override func awakeFromNib() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(TransactionTableViewController.create))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = ApiRequest(resource: TransactionResource())
        request.load { (response) in
            guard let transactions = response else {
                return
            }
            DispatchQueue.main.async {
                self.transactionModelViews = transactions.map { (transaction) -> TransactionTableModelView in
                    TransactionTableModelView(transaction: transaction)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return transactionModelViews.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TransactionCell.self)", for: indexPath) as? TransactionCell else {
            fatalError()
        }
        let imr = ImageRequest(url: URL(string: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.dribbble.com%2Fusers%2F448%2Fscreenshots%2F2017415%2Fheadgear-daredevil-profile-portrait.png&f=1&nofb=1")!)
        imr.load { (image) in
            DispatchQueue.main.async {
                cell.topLeftImageView.image = image
            }
        }
        cell.transactionModelView = transactionModelViews[indexPath.row]
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
