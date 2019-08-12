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
    
    var showAfterDuration : TimeInterval = 0.5
    
    private var animatedViews : [UIView] = []
    
    var animationOptions : UIView.KeyframeAnimationOptions = [.calculationModeLinear]
    
    //MARK:- Intilize
    override init() {
        
    }

    //MARK:- Custom Methods
    @objc func showAnimatedViews() {
        
        let totalAnimationDuration : Double = animatedViews.count == 1 ? 0.7 : 1.0
        
        let animationDuration : Double = totalAnimationDuration / Double(animatedViews.count)
        
        UIView.animateKeyframes(withDuration: totalAnimationDuration, delay: 0, options: animationOptions, animations: {
            
            self.animatedViews.enumerated().forEach({ (detail) in
                
                let y = detail.element.frame.origin.y
                
                detail.element.frame.origin.y = self.toVC!.view.frame.maxY  + 100
                
                UIView.addKeyframe(withRelativeStartTime: Double(detail.offset) * animationDuration, relativeDuration: animationDuration, animations: {
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
        
        if let navigation = presented as? UINavigationController {
            _ = navigation.viewControllers.first?.view
        }
        
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


