//
//  VBAnimator.swift
//  BasicPresentStyle
//
//  Created by bhavin on 11/08/19.
//  Copyright © 2019 Bhavin. All rights reserved.
//

import UIKit

 class VBAnimator: NSObject {
    
    //MARK:- Variables
    
    var toVC: UIViewController?
    
    var showAfterDuration : TimeInterval = 1.0
    
    private var animatedViews : [UIView] = []
    
    //MARK:- Intilize
    override init() {
        
    }

    //MARK:- Custom Methods
    @objc func showAnimatedViews() {
        
        UIView.animateKeyframes(withDuration: Double(animatedViews.count) * 0.2, delay: 0, options: [.calculationModePaced], animations: {
            
            self.animatedViews.enumerated().forEach({ (detail) in
                
                let y = detail.element.frame.origin.y
                
                detail.element.frame.origin.y = self.toVC!.view.frame.maxY  + 100
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: Double(detail.offset + 1) / (Double(self.animatedViews.count) * 0.2), animations: {
                    detail.element.alpha = 1.0
                    detail.element.frame.origin.y = y
                })
            })
        })
    }
    
}

//MARK:- UIViewControllerTransitioningDelegate Methods
extension VBAnimator : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        toVC = presented
        
        if let vwAnimates = self.toVC?.vbProtocol?.animatedViews {
            self.animatedViews = vwAnimates
        }
        
        animatedViews.forEach{ $0.alpha = 0.0 }
        
        self.perform(#selector(showAnimatedViews), with: nil, afterDelay: showAfterDuration)
        
        return nil
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return nil
    }
}


