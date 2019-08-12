//
//  CheckAsyncAnimationVC.swift
//  BasicPresentStyle
//
//  Created by bhavin on 12/08/19.
//  Copyright © 2019 Bhavin. All rights reserved.
//

import UIKit

class CheckKeyFrameAnimationVC: UIViewController {

    @IBOutlet var vwAnimates: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension CheckKeyFrameAnimationVC: VBProtocol {
    var animatedViews: [UIView] {
        return vwAnimates
    }
}
