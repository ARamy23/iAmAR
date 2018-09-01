//
//  MainTabBarController.swift
//  iAmAR
//
//  Created by ScaRiLiX on 8/30/18.
//  Copyright © 2018 ScaRiLiX. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class MainTabBarController: RAMAnimatedTabBarController, UITabBarControllerDelegate {

    weak var listener: ActiveSectionDelegate?
    var previousSelectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if previousSelectedIndex != tabBarController.selectedIndex
        {
            previousSelectedIndex = tabBarController.selectedIndex
            listener?.changedTabTo(tabBarController.selectedIndex)
        }
        else
        {
            listener?.jiggleCurrentTabTitle()
        }
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            return false
        }
        
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        }
        
        return true
    }
}
