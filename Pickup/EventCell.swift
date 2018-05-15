//
//  EventCell.swift
//  Pickup
//
//  Created by Jordan Altaffer on 5/14/18.
//  Copyright © 2018 Jordan Altaffer. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
