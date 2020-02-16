//
//  StoryBoardFactory.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/15/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import Foundation
import UIKit

open class ControllerFactory {
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    func createPhoneVerificationViewController() -> PhoneVerificationViewController {
        return storyboard.instantiateViewController(identifier: "\(PhoneVerificationViewController.self)")
    }
    
    func createMainTabBarController() -> MainTabBarController {
        return storyboard.instantiateViewController(identifier: "\(MainTabBarController.self)")
    }
    
    func createLoginViewController() -> LoginViewController {
        guard let loginVC = storyboard.instantiateViewController(identifier: "\(LoginViewController.self)") as? LoginViewController else {
            fatalError()
        }
        loginVC.modalPresentationStyle = .fullScreen
        return loginVC
    }
    
    func createTransactionDetailTableViewController() -> TransactionDetailTableViewController {
        guard let transDetailVC = storyboard.instantiateViewController(identifier: "\(TransactionDetailTableViewController.self)") as? TransactionDetailTableViewController else {
            fatalError()
        }
        return transDetailVC
    }
    func createAccountViewController() -> AccountTableViewController {

        guard let accountVC = storyboard.instantiateViewController(identifier: "\(AccountTableViewController.self)") as? AccountTableViewController else {
              fatalError()
          }
          return accountVC
    }
}
