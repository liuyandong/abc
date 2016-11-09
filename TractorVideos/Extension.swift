//
//  Extensions.swift
//  TractorVideos
//
//  Created by YAN DONG LIU on 01/11/2016.
//  Copyright © 2016 baochen. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

extension UIView {
    func addconstraintsWithVisualFormat(_ format: String, views: UIView...) {
        
        var viewsDict = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
        
    }
}
