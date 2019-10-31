//
//  ExpandablecellTableViewCell.swift
//  CollapsedTableViewCell
//
//  Created by Suresh Shiga on 30/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var expandLabel: UILabel!
    @IBOutlet weak var expandImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
