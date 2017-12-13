//
//  TableViewCellCategory.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 13..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Domain

class TableViewCellCategory: UITableViewCell {

    func configuration(item: ICategory) {
        self.textLabel?.text = item.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
