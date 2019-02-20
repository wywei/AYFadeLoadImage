//
//  ViewController.swift
//  AYFadeLoadImage
//
//  Created by Andy on 2019/2/20.
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
            // 
            // UIImageView
//            imageView.setFadeImage(with: URL(string: "http://img1.gtimg.com/sports/pics/hv1/182/87/2183/141971942.jpg"), fadeInDuration: 1.0)
//
//            // UIButton
//            iconBtn.setFadeImage(with: URL(string: "http://img1.gtimg.com/sports/pics/hv1/182/87/2183/141971942.jpg"), for: .normal)

            // UIImageView
//            imageView.kf.setImage(with: URL(string: "http://img1.gtimg.com/sports/pics/hv1/182/87/2183/141971942.jpg"))

            imageView.kf.setImage(with: URL(string: "http://img1.gtimg.com/sports/pics/hv1/182/87/2183/141971942.jpg"), options: [KingfisherOptionsInfoItem.transition(ImageTransition.fade(2.0))])

            // UIButton
            iconBtn.kf.setImage(with: URL(string: "http://img1.gtimg.com/sports/pics/hv1/182/87/2183/141971942.jpg"), for: .normal, options: [KingfisherOptionsInfoItem.transition(ImageTransition.custom(duration: 2.0, options: UIView.AnimationOptions.layoutSubviews, animations: { (imageView, image) in

                print("----------来这里")
            }, completion: { (_) in
                print("动画完成=========")
            }))])

        } else {
            imageView.image = nil
            iconBtn.setImage(nil, for: .normal)
            KingfisherManager.shared.cache.clearMemoryCache()
            KingfisherManager.shared.cache.clearDiskCache()
        }
    }

}

