//
//  ExperienceVC.swift
//  iAmAR
//
//  Created by ScaRiLiX on 8/31/18.
//  Copyright © 2018 ScaRiLiX. All rights reserved.
//

import UIKit

protocol ActiveTabDelegate: class {
    func choseTab(at index: Int)
}

class ExperienceVC: UIViewController {

    @IBOutlet weak var skillsButton: UIButton!
    @IBOutlet weak var experienceButton: UIButton!
    @IBOutlet weak var educationButton: UIButton!
    @IBOutlet weak var dynamicBar: UIView!
    
    @IBOutlet weak var DynamicBarLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var DynamicBarTrailingConstraint: NSLayoutConstraint!
    
    var activeButtonIndex: Int = 0
    {
        didSet
        {
            if oldValue != activeButtonIndex
            {
                switch oldValue
                {
                case 0:
                    skillsButton.setTitleColor(UIColor.lightGray, for: .normal)
                    break
                case 1:
                    experienceButton.setTitleColor(UIColor.lightGray, for: .normal)
                    break
                case 2:
                    educationButton.setTitleColor(UIColor.lightGray, for: .normal)
                    break
                default:
                    fatalError("unhandledCase where oldValue = \(oldValue)")
                }
                
                switch activeButtonIndex
                {
                case 0:
                    skillsButton.setTitleColor(#colorLiteral(red: 0.423999995, green: 0.4269999862, blue: 0.7919999957, alpha: 1), for: .normal)
                    break
                case 1:
                    experienceButton.setTitleColor(#colorLiteral(red: 0.423999995, green: 0.4269999862, blue: 0.7919999957, alpha: 1), for: .normal)
                    break
                case 2:
                    educationButton.setTitleColor(#colorLiteral(red: 0.423999995, green: 0.4269999862, blue: 0.7919999957, alpha: 1), for: .normal)
                    break
                default:
                    fatalError("unhandledCase where oldValue = \(activeButtonIndex)")
                }
            }
        }
    }
    
    weak var delegate: ActiveTabDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    fileprivate func animateDynamicView(_ sender: UIButton) {
        
        DynamicBarTrailingConstraint.isActive = false
        DynamicBarLeadingConstraint.isActive = false
        
        DynamicBarLeadingConstraint = dynamicBar.leadingAnchor.constraint(equalTo: sender.leadingAnchor, constant: 0)
        DynamicBarTrailingConstraint = dynamicBar.trailingAnchor.constraint(equalTo: sender.trailingAnchor, constant: 0)
        DynamicBarTrailingConstraint.isActive = true
        DynamicBarLeadingConstraint.isActive = true
        UIView.animate(withDuration: 0.75) {
            self.view.layoutIfNeeded()
            self.view.setNeedsLayout()
        }
    }
    
    @IBAction func didChangeTab(_ sender: UIButton)
    {
        animateDynamicView(sender)
        activeButtonIndex = sender.tag
        delegate?.choseTab(at: sender.tag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MainPageVC
        {
            delegate = destination.self
            destination.parentVCRef = self
        }
    }
}

extension ExperienceVC: DidSwipePages
{
    func didSwipeToPage(with index: Int?) {
        switch index
        {
        case 0:
            animateDynamicView(skillsButton)
            activeButtonIndex = skillsButton.tag
        case 1:
            animateDynamicView(experienceButton)
            activeButtonIndex = experienceButton.tag
        case 2:
            animateDynamicView(educationButton)
            activeButtonIndex = educationButton.tag
        default:
            print("user canceled the swipe")
        }
    }
    
    
}

