//
//  VBHelper.swift
//  BasicPresentStyle
//
//  Created by bhavin on 11/08/19.
//  Copyright © 2019 Bhavin. All rights reserved.
//

import UIKit


extension UIViewController {
    
    
    var vbProtocol: (VBProtocol & UIViewController)? {
        get {
            return UIViewController.findVCWithProtocol(vc: self)
        }
    }
    
    static func findVCWithProtocol(vc: UIViewController) -> (VBProtocol & UIViewController)? {
        
        if let pass = vc as? VBProtocol & UIViewController {
            return pass
        } else {
            var find: (VBProtocol & UIViewController)?
            vc.children.forEach { (vc) in
                if let f = UIViewController.findVCWithProtocol(vc: vc) {
                    find = f
                }
            }
            return find
        }
    }
  
}

//MARK:- Screen Size
struct Screen {
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
}

//MARK:-Animation Direction

enum VBDirection {
    case topTobottom
    case topTotop
    case bottomTotop
    case bottomTobottom
}
