//
//  ImageSlidePVC.swift
//  wynk
//
//  Created by Python on 6/15/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit
import SwiftyJSON

class ImageSlidePVC: UIViewController, UIPageViewControllerDataSource,UIPageViewControllerDelegate {

    var arrJson = [JSON]()
    
    var currentIndex = 0
    
    var pageView = UIPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Full Image"
       
        setFirstVC()
        
    }

    func setFirstVC(){
        
        
        pageView = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageView.delegate = self
        self.pageView.dataSource = self
        
        self.view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        
        
        let vc = VCFullImage.init(nibName: "VCFullImage", bundle: nil)
        vc.imageInfo = arrJson[currentIndex]
        vc.index = currentIndex
        vc.view.tag = currentIndex
        self.pageView.addChild(vc)
        
        self.pageView.setViewControllers([vc], direction: .forward, animated: false, completion: nil)

        self.view.addSubview(pageView.view!)
        
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.arrJson.count
    }

    
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.currentIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        self.currentIndex = pageViewController.viewControllers!.first!.view.tag
    }
   
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if currentIndex-1 >= 0 {
            let vc = VCFullImage.init(nibName: "VCFullImage", bundle: nil)
            vc.imageInfo = arrJson[currentIndex-1]
            vc.view.tag = currentIndex-1
            return vc
        }else{
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
        if currentIndex+1 < arrJson.count {
            let vc = VCFullImage.init(nibName: "VCFullImage", bundle: nil)
            vc.imageInfo = arrJson[currentIndex+1]
            vc.view.tag = currentIndex+1
            return vc
        }else{
            return nil
        }
    }
    
}
