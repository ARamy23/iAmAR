//
//  PortfolioVC.swift
//  iAmAR
//
//  Created by ScaRiLiX on 9/2/18.
//  Copyright © 2018 ScaRiLiX. All rights reserved.
//

import UIKit

class PortfolioVC: UIViewController {

    @IBOutlet weak var portfolioCollectionView: UICollectionView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var detailsTextView: UITextView!
    
    var projects = [Project]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupDatasource()
        portfolioCollectionView.register(UINib(nibName: "PortfolioCell", bundle: nil), forCellWithReuseIdentifier: "PortfolioCell")
        
        detailsView.layer.cornerRadius = 20
        
        
        // shadow
        detailsView.layer.shadowColor = UIColor.black.cgColor
        detailsView.layer.shadowOffset = CGSize(width: 0, height: 0)
        detailsView.layer.shadowOpacity = 0.7
        detailsView.layer.shadowRadius = 10.0
    }

    func setupDatasource()
    {
        let project1 = Project(imageName: #imageLiteral(resourceName: "PiPo"), title: "PiPo", description: "PiPo is a ping pong game that takes you and your friend (Your sworn enemy inside the game!) to the good old days of atari , but on an iPhone")
        let project2 = Project(imageName: #imageLiteral(resourceName: "Coin Ticker"), title: "Coin Ticker", description: "an app which gives you the prices of over 100+ coin in different real-world currencies!")
        let project3 = Project(imageName: #imageLiteral(resourceName: "Climia"), title: "Climia", description: "An app which is able to tell you the weather forecast wherever you are!")
        let project4 = Project(imageName: #imageLiteral(resourceName: "SweetyCandy"), title: "SweetyCrush", description: "SweetyCrush is an app which is inspired by Candy Crush Saga with some small additions like a shuffle button which you can press when you are totally stuck (know that the game will re-shuffle the cookies once there are no possible chains)")
        let project5 = Project(imageName: #imageLiteral(resourceName: "Ozkor"), title: "Ozkor", description: "Stuck on the way to college?\nOr waiting for your turn in a Clinic?\nOr maybe waiting for the food to be prepared?\nYou can make use of the wasted time by doing a couple of Tasabeeh and win some Hasanat while waiting!\ngo ahead and get closer to Allah!")
        let project6 = Project(imageName: #imageLiteral(resourceName: "What is it?"), title: "What is it?", description: "\"What is it?\" is an app made with InceptionV3 MLModel and Wikipedia API which enables you to get immediate information about whatever you take picture of!")
        let project7 = Project(imageName: #imageLiteral(resourceName: "weChat"), title: "weTalk", description: "weTalk is a group meassaging app based on Firebase API with a bit of an inspiration from Twitter")
        let project8 = Project(imageName: #imageLiteral(resourceName: "Concentration"), title: "Concentration", description: "Concentration game from Stanford")
        let project9 = Project(imageName: #imageLiteral(resourceName: "Set"), title: "Set", description: "The Biggest and Hardest game to ever make in Stanford's Course!")
        
        projects.append(project1)
        projects.append(project2)
        projects.append(project3)
        projects.append(project4)
        projects.append(project5)
        projects.append(project6)
        projects.append(project7)
        projects.append(project8)
        projects.append(project9)
    }
}

extension PortfolioVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func slideDetailsViewUp()
    {
        UIView.animate(withDuration: 0.75, animations: {
            self.detailsView.transform = CGAffineTransform(translationX: 0, y: -250)
        })
    }
    
    func slideDetailsViewDown()
    {
        UIView.animate(withDuration: 0.75) {
            self.detailsView.transform = .identity
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PortfolioCell", for: indexPath) as! PortfolioCell
        cell.set(projects[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.width - 50, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        slideDetailsViewUp()
        detailsTextView.text = projects[indexPath.item].description
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        slideDetailsViewDown()
    }
}
