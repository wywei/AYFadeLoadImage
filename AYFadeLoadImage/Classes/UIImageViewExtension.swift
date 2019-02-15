//
//  UIImageExtension.swift
//  AYFadeLoadImage
//
//  Created by Andy on 2019/2/15.
//  Copyright © 2019 wangyawei. All rights reserved.
//  基于Kingfisher对UIImageView做的扩展，渐变的加载图片

import UIKit
import Kingfisher

// 升级版本
// MARK: - Extension methods.
/**
 *    Set image to use from web.
 */
extension Kingfisher where Base: ImageView {

    /**
     Set an image to use for a specified state with a resource, a placeholder image, options, progress handler and
     completion handler.

     - parameter resource:          Resource object contains information such as `cacheKey` and `downloadURL`.
     - parameter fadeInDuration:     The picture fully shows the time interval used. Default 1.0
     - parameter state:             The state that uses the specified image.
     - parameter placeholder:       A placeholder image when retrieving the image at URL.
     - parameter options:           A dictionary could control some behaviors. See `KingfisherOptionsInfo` for more.
     - parameter progressBlock:     Called when the image downloading progress gets updated.
     - parameter completionHandler: Called when the image retrieved and set.

     - note: Both the `progressBlock` and `completionHandler` will be invoked in main thread.
     The `CallbackDispatchQueue` specified in `optionsInfo` will not be used in callbacks of this method.

     If `resource` is `nil`, the `placeholder` image will be set and
     `completionHandler` will be called with both `error` and `image` being `nil`.
     */
    public func setFadeImage(with resource: Resource?,
                          fadeInDuration:CFTimeInterval = 1.0,
                          placeholder: Placeholder? = nil,
                          options: KingfisherOptionsInfo? = nil,
                          progressBlock: DownloadProgressBlock? = nil,
                          completionHandler: CompletionHandler? = nil) {

        setImage(with: resource, placeholder: placeholder, options: options, progressBlock: progressBlock) {[weak base] (image, error, cacheType, url) in
            guard let weakSelf = base else { return }
            if let _ = image {
                let animation = CATransition()
                animation.duration = fadeInDuration
                animation.type = CATransitionType.fade
                animation.isRemovedOnCompletion = true
                weakSelf.layer.add(animation, forKey: "transition")
            }

            if let block = completionHandler {
                block(image, error, cacheType, url)
            }
        }
        base.layer.removeAnimation(forKey: "transition")
    }

}


// 基础版本
extension UIImageView {

    /**
     Set an image to use for a specified state with a resource, a placeholder image, options, progress handler and
     completion handler.

     - parameter resource:          Resource object contains information such as `cacheKey` and `downloadURL`.
     - parameter fadeInDuration:     The picture fully shows the time interval used. Default 1.0
     - parameter state:             The state that uses the specified image.
     - parameter placeholder:       A placeholder image when retrieving the image at URL.
     - parameter options:           A dictionary could control some behaviors. See `KingfisherOptionsInfo` for more.
     - parameter progressBlock:     Called when the image downloading progress gets updated.
     - parameter completionHandler: Called when the image retrieved and set.

     - note: Both the `progressBlock` and `completionHandler` will be invoked in main thread.
     The `CallbackDispatchQueue` specified in `optionsInfo` will not be used in callbacks of this method.

     If `resource` is `nil`, the `placeholder` image will be set and
     `completionHandler` will be called with both `error` and `image` being `nil`.
     */
    public func setFadeImage(with resource: Resource?,
                             fadeInDuration:CFTimeInterval = 1.0,
                             placeholder: Placeholder? = nil,
                             options: KingfisherOptionsInfo? = nil,
                             progressBlock: DownloadProgressBlock? = nil,
                             completionHandler: CompletionHandler? = nil) {

        kf.setImage(with: resource, placeholder: placeholder, options: options, progressBlock: progressBlock) {[weak self] (image, error, cacheType, url) in
            guard let weakSelf = self else { return }
            if let _ = image {
                let animation = CATransition()
                animation.duration = fadeInDuration
                animation.type = CATransitionType.fade
                animation.isRemovedOnCompletion = true
                weakSelf.layer.add(animation, forKey: "transition")
            }

            if let block = completionHandler {
                block(image, error, cacheType, url)
            }
        }
        layer.removeAnimation(forKey: "transition")
    }

}
