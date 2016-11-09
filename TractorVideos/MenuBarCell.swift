//
//  MenuBarCell.swift
//  TractorVideos
//
//  Created by YAN DONG LIU on 02/11/2016.
//  Copyright © 2016 baochen. All rights reserved.
//

import UIKit

class MenuBarCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "tractor")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.init(r: 91, g: 14, b: 13)
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.init(r: 91, g: 14, b: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.init(r: 91, g: 14, b: 13)
        }
    }
    
    override func setupViews() {
        addSubview(imageView)
        addconstraintsWithVisualFormat("H:[v0(100)]", views: imageView)
        addconstraintsWithVisualFormat("V:[v0(100)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}
