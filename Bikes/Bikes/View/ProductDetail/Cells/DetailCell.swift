//
//  DetailCell.swift
//  Bikes
//
//  Created by Admin on 1/9/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
