//
//  ViewController.swift
//  TractorVideos
//
//  Created by baochen on 31/10/2016.
//  Copyright © 2016 baochen. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "homeCellId"
    
    let videos: [Video] = {
        
        var video1 = Video.init(title: "Hello World!", youTubeVideoId: "90CkXVF-Q8M")
        var video2 = Video.init(title: "Hello World!", youTubeVideoId: "90CkXVF-Q8M")
        
        return [video1, video2]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 显示Label“Home”
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-30, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(HomeVideoCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.contentInset = UIEdgeInsetsMake(120, 40, 80, 0)
        
        // 添加menuBar的背景颜色
        view.addSubview(menuBarBackgroundView)
        setupMenuBarBackgroudView()
        
        // 添加menuBar
        view.addSubview(menuBar)
        setupMenuBar()
        
        // 首次启动时，menuBar的第一个cell要处于选定的状态
        let selectedIndex = IndexPath(row: 0, section: 0)
        // collectionView?.selectItem(at: selectedIndex, animated: false, scrollPosition: .left)
        self.menuBar.collectionView.selectItem(at: selectedIndex, animated: false, scrollPosition: .left)
        
    }
    
    // menuBar background color
    let menuBarBackgroundView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.init(r: 239, g: 31, b: 31)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    func setupMenuBarBackgroudView() {
        // x, y, width, height
        menuBarBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        menuBarBackgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        menuBarBackgroundView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        // menuBarBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        menuBarBackgroundView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    // menuBar是导航栏下面的5个按钮
    let menuBar: MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.backgroundColor = UIColor.yellow
        return mb
    }()
    
    func setupMenuBar() {
        // x, y, width, height
        menuBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        menuBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        // menuBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        menuBar.widthAnchor.constraint(equalToConstant: 500).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeVideoCell
        cell.backgroundColor = UIColor.white
        cell.video = videos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3, height: view.frame.height/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}

