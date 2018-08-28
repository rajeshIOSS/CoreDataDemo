//
//  AllDataTableViewCell.swift
//  CoreDataDemo
//
//  Created by Rajesh on 29/08/18.
//  Copyright © 2018 Rajesh. All rights reserved.
//

import UIKit

class AllDataTableViewCell: UITableViewCell {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var pass: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
