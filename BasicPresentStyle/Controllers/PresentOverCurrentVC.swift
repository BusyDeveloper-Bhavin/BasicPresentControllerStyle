//
//  PresentOverCurrentVC.swift
//  BasicPresentStyle
//
//  Created by bhavin on 11/08/19.
//  Copyright © 2019 Bhavin. All rights reserved.
//

import UIKit

class PresentOverCurrentVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet var centerView: UIView!
    @IBOutlet var topView: UIView!
    @IBOutlet var bottomView: UIView!
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

//MARK:- VBProtocol
extension PresentOverCurrentVC: VBProtocol {
    
    var animatedViews: [UIView] {
        return [topView,centerView,bottomView]
    }
}
