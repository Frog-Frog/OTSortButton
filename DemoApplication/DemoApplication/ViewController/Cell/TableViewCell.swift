//
//  TableViewCell.swift
//  DemoApplication
//
//  Created by Tomosuke Okada on 2017/09/14.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    var data = Dictionary<String, String>() {
        didSet {
            leftLabel.text  =  data[DataKey.String]
            centerLabel.text = data[DataKey.Number]
            rightLabel.text = data[DataKey.Date]
        }
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
