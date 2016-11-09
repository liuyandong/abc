//
//  CustomImageView.swift
//  TractorVideos
//
//  Created by YAN DONG LIU on 02/11/2016.
//  Copyright © 2016 baochen. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    var originalUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        
        originalUrlString = urlString
        
        let url = URL(string: urlString)
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler:{(data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                
                if(self.originalUrlString == urlString) {
                    self.image = imageToCache
                }
                imageCache.setObject(imageToCache!, forKey: urlString as NSString)
            }
            
        }).resume()
    }
}
