//
//  MenuBar.swift
//  TractorVideos
//
//  Created by baochen on 31/10/2016.
//  Copyright © 2016 baochen. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let menuCellId = "menuCellId"
    let icons = ["tractor", "truck", "excavator", "train", "loader"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.init(r: 239, g: 31, b: 31)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    // menuBar下面的那条白色的指示条
    let horizontalBarView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0.9, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    func setupHorizontalBarView() {
        // need x, y, width, height constraints
        horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        // horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBarView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCellId, for: indexPath) as! MenuBarCell
        cell.imageView.image = UIImage(named: icons[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(MenuBarCell.self, forCellWithReuseIdentifier: menuCellId)
        
        addSubview(collectionView)
        
        addconstraintsWithVisualFormat("H:|[v0]|", views: collectionView)
        addconstraintsWithVisualFormat("V:|[v0]|", views: collectionView)
        
        // 添加horizontalBar
        addSubview(horizontalBarView)
        setupHorizontalBarView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
