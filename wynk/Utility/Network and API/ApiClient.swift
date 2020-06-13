//
//  ApiClient.swift
//  wynk
//
//  Created by Python on 6/12/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ApiClient: NSObject {
    
    override init() {
        super.init()
    }
    
    
    
    
    static func apiCall(_ url: String,  completion: @escaping (_ response: JSON, _ success : Bool, _ error : String) -> Void) {
        
        let request = AF.request(url)
        request.responseJSON { (data) in

            
            completion(JSON(data.data ?? Data.init()), true, "")
        }
        
        
        
    }
    
    
//  func callAPI(_ urlString : String, parameters: [String: AnyObject]?, method: Method, completion: @escaping (_ response: JSON, _ success : Bool, _ error : String) -> Void) {
//
//
//         print(JSON(parameters ?? ""))
//         print(urlString)
//
//
//         if !(reachability?.isReachable)!{
//             self.showAppToast(LgHelper.common.internet)
//             completion(JSON.null, false,"")
//             return
//         }
//
//          let new = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//
//
//         let url = URL(string: new)
//         if url == nil {
//             //self.showToastTop("url not created")
//             completion(JSON.null, false, "")
//             self.hideLoading()
//             return
//         }
//
//
//         let request = URLRequest.request(url!, method: method, params: parameters)
//         let task = self.session.dataTask(with: request) { (data, urlResponse, error) in
//
//             DispatchQueue.main.async {
//
//                 if error != nil{
//                     //print(error ?? "")
//                     completion(JSON.null, false, (error?.localizedDescription)!)
//                     return
//                 }else{
//                     if let httpStatus = urlResponse as? HTTPURLResponse {
//                         NSLog("APIClient : -->>> \(url?.absoluteString ?? "") \nStatus Code : -->>> \(httpStatus.statusCode)")
//
//                         switch httpStatus.statusCode {
//
//                         case 200, 201, 202, 203, 204:
//                             do {
//                                 var json = try JSON(data: data!)
//                                 print("response: \(json)")
//                                 if json.type == .array {
//                                     completion(json, true, "")
//                                 }else if json.type == .string {
//                                     json["responce"] = json
//                                     completion(json, true, "")
//                                 }else {
//                                     completion(json, true, "")
//                                 }
//                              }
//                             catch {
//                                     completion(JSON.null, false, "Something went wrong, try again.")
//                             }
//                         case 422,404,401,400:do {
//
//                             let json = try JSON(data: data!)
//                             print("Error 422: \(json)")
//
//                             if json["error_code"].stringValue.count > 0 {
//
//                                 if json["error_code"].stringValue == "15" && Convert.getString(object: parameters?["phone_number"] ) != Instance.merchantInfo.mobile {
//
//                                     self.showToastMiddle(LgHelper.getValue(Key: "error_code201"))
//
//                                     completion(json, false,"")
//                                 }else if json["error_code"] != JSON.null {
//
//                                     self.showToastMiddle(LgHelper.getValue(Key: "error_code" + json["error_code"].stringValue))
//                                         completion(json, false,"")
//                                 }
//
//                                 return
//                             }else{
//
//                                 if json.type == .array {
//                                       let title = json.arrayValue.first?["message"].stringValue ?? ""
//                                       completion(json, false,title)
//                                   }else if json.type == .dictionary {
//                                       var error = ""
//                                       if(json["error"].type == .array){
//                                           error = json["error"].arrayValue.first?.stringValue ?? ""
//
//                                       }else if (json["message"] != JSON.null){
//                                           error = json["message"].stringValue
//                                       }else if (json["error"] != JSON.null){
//                                           error = json["error"].stringValue
//                                       }else if (json["error"].type == .dictionary){
//                                           error = json["error"]["error"].stringValue
//                                       }
//                                       completion(json, false, error)
//                                   }else if json.type == .dictionary {
//
//
//                                   }else {
//                                       completion(json, false, "")
//                                   }
//                             }
//                         }catch {
//                             completion(JSON.null, self.responseCodeAlert(statusCode: 422), "")
//                     }
//
//                         default :
//                             do {
//
//                                 let json = try JSON(data: data!)
//                                 print("Error \(httpStatus): \(json)")
//                                 ////print("error Descriptiom : \(urlResponse.debugDescription)for url \(String(describing: url))")
//                                 completion(JSON.null, self.responseCodeAlert(statusCode: httpStatus.statusCode), "")
//                             }
//                             catch {
//                                 completion(JSON.null, self.responseCodeAlert(statusCode: 500), "Something went wrong.")
//                             }
//                         }
//
//                     }else{
//                         completion(JSON.null, false, "Unable to cast http response")
//                     }
//                 }
//                 }//Dispatch Asynch
//         }
//         task.resume()
//     }
//

     
     
    
    
}
