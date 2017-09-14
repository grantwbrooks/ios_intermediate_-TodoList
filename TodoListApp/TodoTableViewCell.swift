//
//  TodoTableViewCell.swift
//  TodoListApp
//
//  Created by Grant Brooks on 9/14/17.
//  Copyright © 2017 Grant Brooks. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var TodoTitle: UILabel!
    @IBOutlet weak var TodoDateLabel: UILabel!
    @IBOutlet weak var TodoBodyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
