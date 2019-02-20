

//
//  ImageCell.swift
//  AYFadeLoadImage
//
//  Created by Andy on 2019/2/20.
//  Copyright © 2019 wangyawei. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var imageViewOne: UIImageView!

    @IBOutlet weak var imageViewTwo: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
