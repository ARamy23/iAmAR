//
//  SplashVC.swift
//  iAmAR
//
//  Created by ScaRiLiX on 9/4/18.
//  Copyright © 2018 ScaRiLiX. All rights reserved.
//

import UIKit

class SplashVC: UIViewController, HolderViewDelegate {
    
    let transition = RevealAnimator()
    var ARLabel: UILabel!
    
    func animateLabel() {
        holderView.removeFromSuperview()
        view.backgroundColor = Colors.blue
        
        // 2
        ARLabel = UILabel(frame: view.frame)
        ARLabel.textColor = Colors.white
        ARLabel.font = UIFont(name: "KGCorneroftheSky", size: 140)
        ARLabel.textAlignment = .center
        ARLabel.text = "AR"
        ARLabel.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
        ARLabel.contentScaleFactor = 4.0
        view.addSubview(ARLabel)
        
        // 3
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: [.curveEaseInOut],
                                   animations: ({
                                    self.ARLabel.transform = CGAffineTransform(scaleX: 2, y: 2)
                                   }), completion: { finished in
                                    
                                    let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainVC
                                    mainVC.transitioningDelegate = self
                                    self.present(mainVC, animated: true, completion: nil)
        })
    }
    

    let holderView = HolderView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addHolderView()
        holderView.addOval()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addHolderView() {
        let boxSize: CGFloat = 100.0
        holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                                  y: view.bounds.height / 2 - boxSize / 2,
                                  width: boxSize,
                                  height: boxSize)
        holderView.parentFrame = view.frame
        holderView.delegate = self
        view.addSubview(holderView)
    }
}

extension SplashVC: UIViewControllerTransitioningDelegate
{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.originFrame = self.view.frame
        
        return transition
    }
    
}







