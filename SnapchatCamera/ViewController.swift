//
//  ViewController.swift
//  SnapchatCamera
//
//  Created by David Seek on 4/17/17.
//  Copyright © 2017 David Seek. All rights reserved.
//

import UIKit

struct Roots {
    static let screenSize: CGRect = UIScreen.main.bounds
}

class ViewController: DSScrollViewController {
    
    var playButton: UIButton!
    var isVertically = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPlayButton()
    }
    
    func setupPlayButton() {
        let rect = CGRect(x: Roots.screenSize.width / 2 - 60,
                          y: Roots.screenSize.height - 280,
                          width: 120,
                          height: 120)
        self.playButton = UIButton(frame: rect)
        self.playButton.setImage(UIImage(named: "playBtnPNG")?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.playButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.view.addSubview(playButton)
    }
}

//
//
// resultY = (desiredY + (originY - desiredY) * facor)
////////////////////////////////////////////////////////////
extension ViewController {
    
    //
    //
    ////////////////////
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        
        if isVertically {
            let factor = scrollView.contentOffset.y / self.view.frame.height
            self.transformElements(self.playButton,
                                   0.45 + 0.55 * factor,
                                   Roots.screenSize.height - 280,
                                   Roots.screenSize.height - 84,
                                   factor)
        } else {
        
            let factor = scrollView.contentOffset.x / Roots.screenSize.width
            var transformedFractionalPage: CGFloat = 0
            
            if factor > 1 {
                transformedFractionalPage = 2 - factor
            } else {
                transformedFractionalPage = factor
            }
            
            self.transformElements(self.playButton,
                                   0.45 + 0.55 * transformedFractionalPage,
                                   Roots.screenSize.height - 280,
                                   Roots.screenSize.height - 84,
                                   transformedFractionalPage)
        }
        
        
    }
    
    func transformElements(_ element: UIView?,
                           _ scale: CGFloat,
                           _ originY: CGFloat,
                           _ desiredY: CGFloat,
                           _ factor: CGFloat) {
        if let e = element {
            e.transform = CGAffineTransform(scaleX: scale, y: scale)
            
            let resultY = desiredY + (originY - desiredY) * factor
            var frame = e.frame
            frame.origin.y = resultY
            e.frame = frame
        }
    }
}
