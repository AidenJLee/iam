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
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbContents: UILabel!
    
    func configuration(item: ICategory) {
        print(lbTitle)
//        self.lbTitle.text = item.name
//        self.lbContents.text = item.depiction
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
