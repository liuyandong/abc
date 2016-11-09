//
//  Video.swift
//  TractorVideos
//
//  Created by YAN DONG LIU on 02/11/2016.
//  Copyright © 2016 baochen. All rights reserved.
//

import UIKit

class Video: NSObject {
    var title: String?
    var youTubeVideoId: String?
    
    init(title: String, youTubeVideoId: String) {
        self.title = title
        self.youTubeVideoId = youTubeVideoId
    }
}
