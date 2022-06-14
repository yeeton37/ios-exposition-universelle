//
//  CustomCell.swift
//  Expo1900
//
//  Created by 이예은 on 2022/06/14.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var bottomDescription: UILabel!
    @IBOutlet weak var image1: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
