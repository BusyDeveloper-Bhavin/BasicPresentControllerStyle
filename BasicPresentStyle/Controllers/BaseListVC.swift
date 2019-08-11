//
//  BaseListVC.swift
//  BasicPresentStyle
//
//  Created by bhavin on 11/08/19.
//  Copyright © 2019 Bhavin. All rights reserved.
//

import UIKit

class BaseListVC: UIViewController {
    
    //MARK:- Variables
    var animator : VBAnimator = VBAnimator()
    
    //MARK:- Action Methods
    @IBAction func btnProgramaticallyCLicked(_ sender: Any) {
        guard let obj : PresentOverCurrentVC = self.storyboard?.instantiateViewController(withIdentifier: "PresentOverCurrentVC") as? PresentOverCurrentVC else { return }
        obj.transitioningDelegate = animator
        obj.modalTransitionStyle = .crossDissolve
        obj.modalPresentationStyle = .overFullScreen //use full screen insted of overCurrentContext
        self.present(obj, animated: true, completion: nil)
    }
    
    //MARK:- Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    //MARK:- Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         segue.destination.transitioningDelegate = animator
    }
}


