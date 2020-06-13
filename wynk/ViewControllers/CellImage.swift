//
//  CellImage.swift
//  wynk
//
//  Created by Python on 6/12/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit

class CellImage: UITableViewCell {

    
    @IBOutlet var imgMain: UIImageView!
    
    class func commonInit() -> CellImage {
        let nibView = Bundle.main.loadNibNamed("CellImage", owner: self, options: nil)?[0] as! CellImage
        nibView.layoutIfNeeded()
        return nibView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
