//
//  VCImages.swift
//  wynk
//
//  Created by Python on 6/12/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit
import SwiftyJSON

class VCImages: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var arrJson = [JSON]()
    @IBOutlet var tblImageList: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Search Result"
        
        tblImageList.delegate = self
        tblImageList.dataSource = self
        
        tblImageList.tableFooterView = UIView()
    }
    

        
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrJson.count
      }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
        }
        
                
            
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                       
            let cell = CellImage.commonInit()
            cell.imgMain.downloadImage(from: arrJson[indexPath.row]["previewURL"].stringValue)
            return cell
        }
        
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
            let pvc = ImageSlidePVC.init(nibName: "ImageSlidePVC", bundle: nil)
            
            pvc.currentIndex = indexPath.row
            pvc.arrJson = arrJson
            
            
            AppUtility.Navigation.pushViewController(pvc, animated: true)
      
        }

    
    
   
}


extension UITableView{
    
    
}
