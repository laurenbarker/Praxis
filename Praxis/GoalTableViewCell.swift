//
//  GoalTableViewCell.swift
//  Praxis
//
//  Created by Lauren Barker on 11/4/15.
//  Copyright © 2015 Lauren Barker. All rights reserved.
//

import UIKit

class GoalTableViewCell: UITableViewCell {

    @IBOutlet weak var goalDisplay: UITextField!
    @IBOutlet weak var unitDisplay: UITextField!
    @IBOutlet weak var incrementController: UIStepper!
    @IBOutlet weak var titleDisplay: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
