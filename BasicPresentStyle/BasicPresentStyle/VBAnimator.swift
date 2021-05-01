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
    
    var animationDuration = 0.7
    
    private var animationDirection: VBDirection = .topTobottom
    
    //MARK:- Intilize
    override init() {
        
    }
    
    init(direction: VBDirection) {
        self.animationDirection = direction
    }

    //MARK:- Custom Methods
    @objc func showAnimatedViews() {
        
        let totalAnimationDuration : Double = animatedViews.count == 1 ? animationDuration : 1.0
        
        let animationDuration : Double = totalAnimationDuration / Double(animatedViews.count)
        
        UIView.animateKeyframes(withDuration: totalAnimationDuration, delay: 0, options: animationOptions, animations: {
            
            self.animatedViews.enumerated().forEach({ (detail) in
                
                let y = detail.element.frame.origin.y
                
                switch self.animationDirection {
                case .bottomTotop, .bottomTobottom:
                    detail.element.frame.origin.y = Screen.height 
                    break
                case .topTobottom, .topTotop:
                    detail.element.frame.origin.y = -detail.element.frame.maxY / 2.0
                    break
                }
                
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
        
        return DismissHelper.init(animatedViews: self.animatedViews, direction: self.animationDirection)
    }
    
    
}

//MARK:- DismissAnimator
fileprivate class DismissHelper: NSObject, UIViewControllerAnimatedTransitioning {
    
    //MARK:- Variables
    private var animatedViews : [UIView] = []
    private var animationDirection: VBDirection = .topTobottom
    
    var animationOptions : UIView.KeyframeAnimationOptions = [.calculationModeLinear]
    
    //MARK:- init
    init(animatedViews: [UIView], direction: VBDirection) {
        self.animatedViews = animatedViews
        animationDirection = direction
    }
    
    //MARK:- UIViewControllerAnimatedTransitioning Method
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        UIView.animate(withDuration: 1.0) {
            self.animatedViews.enumerated().forEach({ (detail) in
                switch self.animationDirection {
                case .topTobottom, .bottomTobottom:
                    detail.element.frame.origin.y = Screen.height
                    break
                case .bottomTotop, .topTotop:
                    detail.element.frame.origin.y = -Screen.height - detail.element.frame.height
                    break
                }
                
            })
        }completion: { (_) in
            transitionContext.completeTransition(true)
        }

    }
}
