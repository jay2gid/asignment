//
//  VCSearch.swift
//  wynk
//
//  Created by Python on 6/12/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit
import SwiftyJSON

class VCSearch: UIViewController,UISearchBarDelegate,ProtocolSuggetionSeleted {
    

    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var viewForSuggetion: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Search"
        searchBar.searchTextField.becomeFirstResponder()
        searchBar.delegate = self
        
        setSuggetionView()
    }
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text,  searchText.count>0 else {
            self.showAlert(title: "", message: "Enter text to search.")
            return
        }
                
        searchApi(str: searchText)
    }
    
    
    
    func searchApi(str:String){
        
        let url = AppConstant.ApiUrl.proxybay + "&q=" +  str
        
        ApiClient.apiCall(url) { (json, success, error) in
            if json["total"].intValue == 0 {
                self.showAlert(title: "", message: "No result found.")
            }else{
                AppUtility.coreData.addSearchString(value: str)
                self.gotoNextVC(json: json)
                print(json)
            }
        }
        
    }
    
    
    func gotoNextVC(json:JSON) {
        
        let vc = VCImages.init(nibName: "VCImages", bundle: nil)
        vc.arrJson = json["hits"].arrayValue
        AppUtility.Navigation.pushViewController(vc, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if viewSugetion != nil {
            viewSugetion.reaload()
        }
    }
    
    
    
    var viewSugetion : ViewSuggetion!
    func setSuggetionView() {
        
        viewSugetion = ViewSuggetion.commonInit()
        viewSugetion.frame = viewForSuggetion.bounds
        viewSugetion.delegate = self
        viewForSuggetion.addSubview(viewSugetion)
    }
    
    
    func onKeywordSelected(keyword: String) {
        searchApi(str: keyword)
    }
    
    
    
    
}
