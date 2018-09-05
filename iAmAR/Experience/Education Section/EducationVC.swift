//
//  EducationVC.swift
//  iAmAR
//
//  Created by ScaRiLiX on 9/1/18.
//  Copyright © 2018 ScaRiLiX. All rights reserved.
//

import UIKit
import TimelineTableViewCell
import YXWaveView

class EducationVC: UIViewController {

    var waveView: YXWaveView!
    
    @IBOutlet weak var waveContainerView: UIView!
    @IBOutlet weak var educationTimelineTableVIew: UITableView!
    let data: [(TimelinePoint, UIColor, String, String, String?, String?, String?)] = [
        (TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "28/7/2017", "Finished CS50", "I Took CS50", nil, "Sun"),
        (TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "16/9/2017", "Began my first college year", "Started College", nil, "Sun"),
        (TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "27/12/2017", "Began my first iOS Course", "Started iOS Development", nil, "Sun")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let bundle = Bundle(for: TimelineTableViewCell.self)
        let nibUrl = bundle.url(forResource: "TimelineTableViewCell", withExtension: "bundle")
        let timelineTableViewCellNib = UINib(nibName: "TimelineTableViewCell",
                                             bundle: Bundle(url: nibUrl!)!)
        educationTimelineTableVIew.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")
        let frame = waveContainerView.bounds
        waveView = YXWaveView(frame: frame, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        waveView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        waveView.realWaveColor = #colorLiteral(red: 0.423999995, green: 0.4269999862, blue: 0.7919999957, alpha: 1)
        waveView.maskWaveColor = #colorLiteral(red: 0.8820000291, green: 0.7250000238, blue: 0.8389999866, alpha: 1)
        waveView.waveHeight = 40
        waveView.waveCurvature = 1.2
        waveView.frame.size.width = waveContainerView.width
        waveContainerView.addSubview(waveView)
        
        let label = UILabel(text: "That's all Folks...")
        label.font = UIFont(name: "KGCorneroftheSky", size: 23)
        label.textColor = UIColor.black
        label.layer.masksToBounds = true
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 44)
        waveView.addOverView(label)
        waveView.overView!.center.x = view.center.x
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTableViewCells()
        waveView.start()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        waveView.stop()
    }
    
}



extension EducationVC: UITableViewDelegate, UITableViewDataSource
{
    func animateTableViewCells()
    {
        educationTimelineTableVIew.reloadData()
        let cells = educationTimelineTableVIew.visibleCells as! [TimelineTableViewCell]
        let tableHeight = educationTimelineTableVIew.height
        
        for cell in cells
        {
            cell.transform = CGAffineTransform(translationX: 0, y: -tableHeight)
            cell.alpha = 0
        }
        
        var index = 0
        
        for cell in cells
        {
            UIView.animate(withDuration: 3, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = .identity
                cell.alpha = 1
            }, completion: nil)
            index += 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        
        // Configure the cell...
        let sectionData = data[indexPath.row]
        
        let (timelinePoint, timelineBackColor, title, description, lineInfo, thumbnail, illustration) = sectionData
        var timelineFrontColor = UIColor.clear
        if (indexPath.row > 0) {
            timelineFrontColor = sectionData.1
        }
        cell.timelinePoint = timelinePoint
        cell.timeline.frontColor = timelineFrontColor
        cell.timeline.backColor = timelineBackColor
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        cell.lineInfoLabel.text = lineInfo
        if let thumbnail = thumbnail {
            cell.thumbnailImageView.image = UIImage(named: thumbnail)
        }
        else {
            cell.thumbnailImageView.image = nil
        }
        if let illustration = illustration {
            cell.illustrationImageView.image = UIImage(named: illustration)
        }
        else {
            cell.illustrationImageView.image = nil
        }
        
        return cell
    }
    
    
}
