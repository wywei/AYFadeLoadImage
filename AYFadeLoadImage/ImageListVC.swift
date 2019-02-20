
//
//  ImageListVC.swift
//  AYFadeLoadImage
//
//  Created by Andy on 2019/2/20.
//  Copyright © 2019 wangyawei. All rights reserved.
//

import UIKit
import Kingfisher
class ImageListVC: UIViewController {


    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 130
        tableView.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "ImageCell")

        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)

        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        KingfisherManager.shared.cache.clearMemoryCache()
        KingfisherManager.shared.cache.clearDiskCache()
    }

}

extension ImageListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.imageViewOne.image = nil
        cell.imageViewTwo.image = nil
        cell.button.setImage(nil, for: .normal)
        KingfisherManager.shared.cache.clearMemoryCache()
        KingfisherManager.shared.cache.clearDiskCache()

        // 渐变加载显示图片
        cell.imageViewOne.kf.setFadeImage(with: URL(string: "http://img1.gtimg.com/sports/pics/hv1/182/87/2183/141971942.jpg"), fadeInDuration: 2.0)
        cell.imageViewTwo.kf.setFadeImage(with: URL(string: "http://img1.gtimg.com/sports/pics/hv1/182/87/2183/141971942.jpg"), fadeInDuration: 2.0)


        //cell.button.kf.setFadeImage(with: URL(string: "http://img1.gtimg.com/sports/pics/hv1/182/87/2183/141971942.jpg"), for: .normal, fadeInDuration: 2.0)
        // 非渐变加载显示图片
        cell.button.kf.setImage(with: URL(string: "http://img1.gtimg.com/sports/pics/hv1/182/87/2183/141971942.jpg"), for: .normal, options: [KingfisherOptionsInfoItem.transition(ImageTransition.fade(2.0))])


        return cell
    }


}
