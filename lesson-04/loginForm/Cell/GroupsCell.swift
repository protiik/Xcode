//
//  GroupsCell.swift
//  loginForm
//
//  Created by prot on 10/02/2020.
//  Copyright © 2020 prot. All rights reserved.
//

import UIKit

class GroupsCell: UITableViewCell {

    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupImageView: UIImageView!

    override func layoutSubviews() {
        groupImageView.layer.cornerRadius = 42
    }
    
        
}
