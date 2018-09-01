//
//  ExperienceSectionVC.swift
//  iAmAR
//
//  Created by ScaRiLiX on 8/31/18.
//  Copyright © 2018 ScaRiLiX. All rights reserved.
//

import UIKit
import TimelineTableViewCell

class ExperienceSectionVC: UIViewController {

    @IBOutlet weak var timelineTableView: UITableView!
    
    let data: [Int: [(TimelinePoint, UIColor, String, String, String?, String?, String?)]] =
    [
        0: [(TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "27/12/2017", "Began with an Offline course and a Udemy Course Called iOS Bootcamp from Angela Yu in parallel", "Started Learning iOS", nil, "Sun")],
        1:[(TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "03/2018", "Finished all the sections of the online iOS Bootcamp with all the challenges", "Completed Angela Yu's Online Course", nil, "Sun"),
        (TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "03/2018", "Completed My first full app which was a food ordering app clone with dummy backend", "Made Otlob Clone", nil, "Sun"),
        (TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "03/2018", "Made an Object Identifier app which takes a photo of any object and identifies it a through Wikipedia API with 72% accuracy", "Made an Object Identifier", nil, "Sun"),
        (TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "03/2018", "Made a Ping Pong game with 3 Different Levels of diffculty", "Made a Ping Pong Game", nil, "Sun")]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let bundle = Bundle(for: TimelineTableViewCell.self)
        let nibUrl = bundle.url(forResource: "TimelineTableViewCell", withExtension: "bundle")
        let timelineTableViewCellNib = UINib(nibName: "TimelineTableViewCell",
                                             bundle: Bundle(url: nibUrl!)!)
        timelineTableView.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")
    }

}

extension ExperienceSectionVC: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionData = data[section] else { return 0 }
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section
        {
        case 0:
            return "Month 1"
        case 1:
            return "Month 3"
        default:
            break
        }
        
        return "Month Undefined"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        
        // Configure the cell...
        guard let sectionData = data[indexPath.section] else {
            return cell
        }
        
        let (timelinePoint, timelineBackColor, title, description, lineInfo, thumbnail, illustration) = sectionData[indexPath.row]
        var timelineFrontColor = UIColor.clear
        if (indexPath.row > 0) {
            timelineFrontColor = sectionData[indexPath.row - 1].1
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
