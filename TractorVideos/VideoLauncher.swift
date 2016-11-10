//
//  VideoLauncher.swift
//  TractorVideos
//
//  Created by baochen on 09/11/2016.
//  Copyright © 2016 baochen. All rights reserved.
//

import UIKit
import XCDYouTubeKit

class VideoPlayerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.yellow
        
        let videoId = "-NSvbGxzpKk"
        let youtubeVideoPlayer = XCDYouTubeVideoPlayerViewController(videoIdentifier: videoId)
        youtubeVideoPlayer.present(in: self)
        youtubeVideoPlayer.moviePlayer.play()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class VideoLauncher: NSObject {
    
    func showVideoPlayer() {
        
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = UIColor.white
            
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            
            // 设置video Player的尺寸
            let height = keyWindow.frame.width * 9/16
            let videoPlayerFrame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height)
            
            // 初始化video player以后，将该view添加到view上
            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
            view.addSubview(videoPlayerView)
            
            // 点击以后的一个动画效果，view从右下脚一个动画上来占满屏幕
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                // view满屏
                view.frame = keyWindow.frame
            }, completion: { (completedAnimation) in
                UIApplication.shared.isStatusBarHidden = true
            })
            
            keyWindow.addSubview(view)
        }
    }
    
}
