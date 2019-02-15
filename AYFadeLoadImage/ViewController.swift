//
//  ViewController.swift
//  AYFadeLoadImage
//
//  Created by Andy on 2019/2/15.
//  Copyright © 2019 wangyawei. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var iconBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected

        if sender.isSelected {
            // UIImageView
            imageView.setFadeImage(with: URL(string: "http://img1.gtimg.com/sports/pics/hv1/182/87/2183/141971942.jpg"), fadeInDuration: 1.0)

            // UIButton
            iconBtn.setFadeImage(with: URL(string: "http://img1.gtimg.com/sports/pics/hv1/182/87/2183/141971942.jpg"), for: .normal)

        } else {
            imageView.image = nil
            iconBtn.setImage(nil, for: .normal)
            KingfisherManager.shared.cache.clearMemoryCache()
            KingfisherManager.shared.cache.clearDiskCache()
        }
    }

}

