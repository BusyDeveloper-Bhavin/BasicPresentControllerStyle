//
//  SingleViewPresentVC.swift
//  BasicPresentStyle
//
//  Created by bhavin on 11/08/19.
//  Copyright © 2019 Bhavin. All rights reserved.
//

import UIKit

class SingleSubViewPresentVC: UIViewController {

    //MARK:- Outlets
    @IBOutlet var centerView: UIView!
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

//MARK:- VBProtocol
extension SingleSubViewPresentVC: VBProtocol {
    
    var animatedViews: [UIView] {
        return [centerView]
    }
}
