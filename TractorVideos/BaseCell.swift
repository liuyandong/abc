//
//  BaseCell.swift
//  TractorVideos
//
//  Created by baochen on 31/10/2016.
//  Copyright © 2016 baochen. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
