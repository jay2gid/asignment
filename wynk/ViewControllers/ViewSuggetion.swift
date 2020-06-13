//
//  ViewSuggetion.swift
//  wynk
//
//  Created by Python on 6/13/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit

class ViewSuggetion: UIView,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var arrString = [String]()
    
    var delegate : ProtocolSuggetionSeleted?
    
    
    class func commonInit() -> ViewSuggetion {
        let nibView = Bundle.main.loadNibNamed("ViewSuggetion", owner: self, options: nil)?[0] as! ViewSuggetion
        nibView.layoutIfNeeded()
        return nibView
    }
    
    override func draw(_ rect: CGRect) {
        
        arrString = AppUtility.coreData.getValues(str: "")
        table.delegate = self
        table.dataSource = self
        table.reloadData()
    }
    

    func reaload() {
        arrString = AppUtility.coreData.getValues(str: "")
        table.reloadData()
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrString.count > 9 {
                return 10
        }else{
                return arrString.count
        }
        
    }
      
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 40
      }
      
              
          
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                     
        let cell = UITableViewCell.init(style: .value1, reuseIdentifier: "none")
          
        cell.textLabel?.text = arrString[indexPath.row]
        return cell
      }
      
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            delegate?.onKeywordSelected(keyword: arrString[indexPath.row])
      }

    

}

protocol ProtocolSuggetionSeleted {
    func onKeywordSelected(keyword:String)
}
