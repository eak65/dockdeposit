//
//  TransactionCell.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/15/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {

    @IBOutlet var topTextLabel: UILabel!
    @IBOutlet var topRightTextLabel: UILabel!
    @IBOutlet var middleTextLabel: UILabel!
    @IBOutlet var buttonButton: UIButton!
    @IBOutlet var topLeftImageView: UIImageView!
    var action_ButtonBottom : ((UIButton)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func action_buttonBottom(_ sender: Any) {
        guard let actionButton = action_ButtonBottom else {
            return
        }
        actionButton(buttonButton)
    }
    
}
