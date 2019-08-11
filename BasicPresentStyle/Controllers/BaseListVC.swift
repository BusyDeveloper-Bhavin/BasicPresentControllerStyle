//
//  BaseListVC.swift
//  BasicPresentStyle
//
//  Created by bhavin on 11/08/19.
//  Copyright © 2019 Bhavin. All rights reserved.
//

import UIKit

class BaseListVC: UIViewController {

    var animator : VBAnimator = VBAnimator()
    
    @IBAction func btnProgramaticallyCLicked(_ sender: Any) {
        guard let obj : PresentOverCurrentVC = self.storyboard?.instantiateViewController(withIdentifier: "PresentOverCurrentVC") as? PresentOverCurrentVC else { return }
        obj.transitioningDelegate = animator
        obj.modalTransitionStyle = .crossDissolve
        obj.modalPresentationStyle = .overFullScreen //use full screen insted of overCurrentContext
        self.present(obj, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = animator
    }
}


