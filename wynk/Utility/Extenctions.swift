//
//  Extenctions.swift
//  wynk
//
//  Created by Python on 6/12/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit




extension NSObject {
    
    
    func showAlert(title:String ,message: String?) {

        if (message == nil || message == "" ) {
            return
        }

        let view = UIApplication.topViewController()
        let errorMessage = message ?? "MESSAGE"
        let errorController = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        errorController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        view?.present(errorController, animated: true, completion: nil)
    }


}

extension UIApplication {
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    

    
}



extension UIImageView{
    
    func downloadImage(from urlString: String) {
        
        let url = URL.init(string: urlString)
        
        
        if let imgUlr = url {
            getData(from: imgUlr ) { data, response, error in
                   guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? imgUlr.lastPathComponent)
                
                   DispatchQueue.main.async() { [weak self] in
                       self?.image = UIImage(data: data)
                   }
            }
        }
       
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
