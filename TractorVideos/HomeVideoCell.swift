//
//  HomeVideoCell.swift
//  TractorVideos
//
//  Created by YAN DONG LIU on 02/11/2016.
//  Copyright © 2016 baochen. All rights reserved.
//

import UIKit

class HomeVideoCell: BaseCell {
    
    var video: Video? {
        didSet {
            setupThumbnailImage()
        }
    }
    
    func setupThumbnailImage() {
        if let thumbnailUrl = video?.youTubeVideoId {
            let url = "https://img.youtube.com/vi/\(thumbnailUrl)/sddefault.jpg"
            videoThumbnailView.loadImageUsingUrlString(urlString: url)
        }
    }
    
    let videoThumbnailView: CustomImageView = {
        let iv = CustomImageView()
        iv.backgroundColor = UIColor.green
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Hello world, hello world"
        lb.backgroundColor = UIColor.yellow
        return lb
    }()
    
    override func setupViews() {
        addSubview(videoThumbnailView)
        addSubview(titleLabel)
        
        // 以下代码是给UICollectionViewCell添加阴影的效果
        self.contentView.layer.cornerRadius = 1.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true;
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width:0,height: 1.0)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false;
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
        
        addconstraintsWithVisualFormat("H:|-[v0]-|", views: videoThumbnailView)
        addconstraintsWithVisualFormat("H:|-[v0]-|", views: titleLabel)
        addconstraintsWithVisualFormat("V:|-[v0]-0-[v1(40)]-|", views: videoThumbnailView, titleLabel)
        
    }
    
}
