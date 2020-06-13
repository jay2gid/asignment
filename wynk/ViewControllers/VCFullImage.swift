//
//  VCFullImage.swift
//  wynk
//
//  Created by Python on 6/13/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit
import SwiftyJSON

class VCFullImage: UIViewController {

    @IBOutlet var imgFullSize: UIImageView!
    
    var imageInfo = JSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()
    }


    func loadImage()  {
        imgFullSize.downloadImage(from: imageInfo["previewURL"].stringValue)
        imgFullSize.downloadImage(from: imageInfo["largeImageURL"].stringValue)
    }
}
