//
//  MainVC.swift
//  iAmAR
//
//  Created by ScaRiLiX on 8/30/18.
//  Copyright © 2018 ScaRiLiX. All rights reserved.
//

import UIKit


protocol ActiveSectionDelegate: class
{
    func changedTabTo(_ i: Int)
    func jiggleCurrentTabTitle()
}

class MainVC: UIViewController {

    @IBOutlet weak var sectionBar: UIView!
    @IBOutlet weak var SectionNameLeftAnchorConstraint: NSLayoutConstraint!
    @IBOutlet weak var sectionNameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var identityHeightConstant: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sectionNameLabel.transform = CGAffineTransform(translationX: -140, y: 0)
        slideSectionLabelLeft()
        setupGradient()
    }

    func setupGradient()
    {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(
            x: -sectionBar.bounds.size.width,
            y: sectionBar.bounds.origin.y,
            width: 3 * sectionBar.bounds.size.width,
            height: sectionBar.bounds.size.height + 10)
        gradient.colors = [#colorLiteral(red: 0.423999995, green: 0.4269999862, blue: 0.7919999957, alpha: 1).cgColor,#colorLiteral(red: 0.423999995, green: 0.4269999862, blue: 0.7919999957, alpha: 1).cgColor, #colorLiteral(red: 0.8820000291, green: 0.7250000238, blue: 0.8389999866, alpha: 1).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.drawsAsynchronously = true
        sectionBar.layer.addSublayer(gradient)
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 5.0
        gradientChangeAnimation.toValue = [#colorLiteral(red: 0.8820000291, green: 0.7250000238, blue: 0.8389999866, alpha: 1).cgColor, #colorLiteral(red: 0.423999995, green: 0.4269999862, blue: 0.7919999957, alpha: 1).cgColor, #colorLiteral(red: 0.423999995, green: 0.4269999862, blue: 0.7919999957, alpha: 1).cgColor]
        gradientChangeAnimation.fillMode = kCAFillModeForwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradientChangeAnimation.autoreverses = true
        gradientChangeAnimation.repeatCount = .infinity
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Tabbar"
        {
            let tabbar = segue.destination as! MainTabBarController
            tabbar.listener = self
        }
    }
    
    func slideSectionLabelLeft()
    {
        sectionNameLabel.text = "About Me!"
        UIView.animate(withDuration: 0.5) {
            self.sectionNameLabel.transform = .identity
        }
    }
    
}

extension MainVC: ActiveSectionDelegate
{
    func changedTabTo(_ i: Int) {
        
        AnimatorFactory().flipLeftToRight(sectionNameLabel, i: i)
    }
    
    func jiggleCurrentTabTitle() {
        AnimatorFactory().jiggle(sectionNameLabel)
    }
}
