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
        (TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "03/2018", "Made a Ping Pong game with 3 Different Levels of diffculty", "Made a Ping Pong Game", nil, "Sun")],
        2:[(TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "04/2018", "Made a College project which calculates the simplex method and got 20 points", "Simplex Method App", nil, "Sun"),
        (TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "04/2018", "Created my first game which is Ping Pong Game", "Made PiPo", nil, "Sun")],
        3:[(TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "05/2018", "A Tasbih App with pretty pulse animation", "Made Ozkor", nil, "Sun")],
        4:[(TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "06/2018", "Got my first Internship", "Wi-Fi Metropolis", nil, "Sun")],
        5:[(TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "07/2018", "Published My First Open-source project which is a TDD Network Layer Inspired from a fellow Developer", "First Open-source project", nil, "Sun"),
        (TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "07/2018", "Published My 2nd Open-source project which is a generic CollectionViewController and a TableViewController in-which u just pass it ur datasource and it will display it without a hassle", "Second Open-source project", nil, "Sun"),
        (TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "07/2018", "Finally finished Stanford's CS193P Course with all it's assignments", "Finished CS193P", nil, "Sun"),
        (TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "07/2018", "Decided to leave the Internship at just that and continue my career as an Upwork freelancer", "Finished My Internship with Wi-Fi Metropolis", nil, "Sun")],
        6:[(TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "08/2018", "Finished Ray Wenderlich: Animations Tutorials with all it's challenges", "Who's animating here and there now?", nil, "Sun")],
        7:[(TimelinePoint(), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), "First Day of September", "Started Working on Upwork", "New Month\nNew Start", nil, "Sun")]
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
            return "Januray"
        case 1:
            return "March"
        case 2:
            return "April"
        case 3:
            return "May"
        case 4:
            return "June"
        case 5:
            return "July"
        case 6:
            return "August"
        case 7:
            return "September"
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
