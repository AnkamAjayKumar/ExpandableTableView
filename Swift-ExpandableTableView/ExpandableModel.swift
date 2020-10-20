//
//  ExpandableModel.swift
//  Swift-ExpandableTableView
//
//  Created by narendra. vadde on 10/10/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import Foundation
import UIKit

class CellData {
    var isOpened: Bool
    var title: String
    var image: String
    var sectionData: [SectionData]
    
    init(isOpened: Bool, title: String, image: String, sectionData: [SectionData]) {
        self.isOpened = isOpened
        self.title = title
        self.image = image
        self.sectionData = sectionData
    }
}

class SectionData {
    var title: String
    var isSelected: Bool = false
    
    init(title: String) {
        self.title = title
    }
}
