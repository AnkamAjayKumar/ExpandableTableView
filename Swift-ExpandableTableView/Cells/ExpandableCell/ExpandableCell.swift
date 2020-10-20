//
//  ExpandableCell.swift
//  Swift-ExpandableTableView
//
//  Created by narendra. vadde on 09/10/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var expandedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
