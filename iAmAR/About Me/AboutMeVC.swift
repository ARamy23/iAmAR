//
//  AboutMeVC.swift
//  iAmAR
//
//  Created by ScaRiLiX on 8/31/18.
//  Copyright © 2018 ScaRiLiX. All rights reserved.
//

import UIKit
import SwifterSwift

class AboutMeVC: UIViewController {

    @IBOutlet weak var infoTableView: UITableView!
    
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var myPositionLabel: UILabel!
    @IBOutlet weak var myDescriptionLabel: UILabel!
    
    var infoKeys: [String] = ["Phone", "E-mail", "Facebook"]
    var infoValues: [String] = ["+20 106 847 6461", "Dev.AhmedRamy@gmail.com", "A.RaMy236"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        infoTableView.register(UINib(nibName: "AboutMeCell", bundle: nil), forCellReuseIdentifier: "AboutMeCell")
        setupUIElementsForAnimation()
        myImageView.layer.cornerRadius = myImageView.height / 2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUIElementsForAnimation()
    }
    
    fileprivate func setupUIElementsForAnimation()
    {
        myImageView.transform = CGAffineTransform(translationX: 0, y: -500)
        myImageView.alpha = 0
        
        myNameLabel.transform = CGAffineTransform(translationX: 0, y: -100)
        myNameLabel.alpha = 0
        
        myPositionLabel.transform = CGAffineTransform(translationX: 0, y: -100)
        myPositionLabel.alpha = 0
        
        myDescriptionLabel.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        myDescriptionLabel.alpha = 0
        
        infoTableView.transform = CGAffineTransform(translationX: 0, y: 300)
        infoTableView.alpha = 0
    }
    
    fileprivate func animateUI()
    {
        UIView.animateKeyframes(withDuration: 2, delay: 0, animations: {
            //Animate MyImageView
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2, animations: {
                self.myImageView.transform = .identity
                self.myImageView.alpha = 1.0
            })
            
            //Animate MyNameLabel
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.2, animations: {
                self.myNameLabel.transform = .identity
                self.myNameLabel.alpha = 1.0
            })
            //
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.2, animations: {
                self.myPositionLabel.transform = .identity
                self.myPositionLabel.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.2, animations: {
                self.myDescriptionLabel.transform = .identity
                self.myDescriptionLabel.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2, animations: {
                self.infoTableView.transform = .identity
                self.infoTableView.alpha = 1.0
            })
        }, completion: nil)
        
        
    }
    
    
}

extension AboutMeVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutMeCell", for: indexPath) as! AboutMeCell
        cell.setCellSection(key: infoKeys[indexPath.row], value: infoValues[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / CGFloat(infoValues.count)
    }
}
