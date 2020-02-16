//
//  MainTabBarController.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/15/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let storyBoardFactory = StoryBoardFactory()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
       // present(storyBoardFactory.createLoginViewController(), animated: true, completion: nil)
    }

}
