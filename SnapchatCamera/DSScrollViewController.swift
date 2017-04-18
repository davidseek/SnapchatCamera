//
//  ViewController.swift
//  SnapchatCamera
//
//  Created by David Seek on 4/17/17.
//  Copyright © 2017 David Seek. All rights reserved.
//

import UIKit

class DSScrollViewController: UIViewController, UIScrollViewDelegate {

    var scrollView: UIScrollView!
    var zeroCG: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        
        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.scrollView.delegate = self
        self.scrollView.isPagingEnabled = true
        self.scrollView.bounces = false
        
        let v1 : View1 = View1(nibName: "View1", bundle: nil)
        let v2 : View2 = View2(nibName: "View2", bundle: nil)
        let v3 : View3 = View3(nibName: "View3", bundle: nil)
        
        self.setupViewsHorizontally(v1, v2, v3)
        // ALTERNATIVELY 
        //self.setupViewsVertically(v1, v2, v3)
    }
}

extension DSScrollViewController {
    
    func setupViewsHorizontally(_ v1: UIViewController,
                                _ v2: UIViewController,
                                _ v3: UIViewController) {
        
        self.addViewControllers(v1, v2, v3)
        self.sizeViewControllers(v1, v2, v3)
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height)
        self.scrollView.contentOffset = CGPoint(x: self.view.frame.width, y: zeroCG)
        
        self.view.addSubview(self.scrollView)
    }
    
    func setupViewsVertically(_ v1: UIViewController,
                              _ v2: UIViewController,
                              _ v3: UIViewController) {
        
        self.addViewControllers(v1, v2, v3)
        self.sizeViewControllers(v1, v2, v3)
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 2)
        self.scrollView.contentOffset = CGPoint(x: zeroCG, y: self.view.frame.height)
        
        self.view.addSubview(self.scrollView)
    }
}

extension DSScrollViewController {
    
    func addViewControllers(_ v1: UIViewController,
                            _ v2: UIViewController,
                            _ v3: UIViewController) {
        self.addChildViewController(v1)
        self.scrollView.addSubview(v1.view)
        v1.didMove(toParentViewController: self)
        
        self.addChildViewController(v2)
        self.scrollView.addSubview(v2.view)
        v2.didMove(toParentViewController: self)
        
        self.addChildViewController(v3)
        self.scrollView.addSubview(v3.view)
        v3.didMove(toParentViewController: self)
    }
    
    func sizeViewControllers(_ v1: UIViewController,
                             _ v2: UIViewController,
                             _ v3: UIViewController) {
        var v1Frame : CGRect = self.view.frame
        v1Frame.origin.x = 0
        v1.view.frame = v1Frame
        
        var v2Frame : CGRect = self.view.frame
        v2Frame.origin.x = self.view.frame.width
        v2.view.frame = v2Frame
        
        var v3Frame : CGRect = self.view.frame
        v3Frame.origin.x = self.view.frame.width * 2
        v3.view.frame = v3Frame
    }
}
