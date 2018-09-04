//
//  MainPageVC.swift
//  iAmAR
//
//  Created by ScaRiLiX on 8/31/18.
//  Copyright © 2018 ScaRiLiX. All rights reserved.
//

import UIKit

protocol DidSwipePages: class
{
    func didSwipeToPage(with index: Int?)
}

class MainPageVC: UIPageViewController {

    private(set) lazy var orderedViewControllers: [UIViewController] =
    {
        return [UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SkillsVC"),
                UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExperienceVC"),
                UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EducationVC")]
    }()
    
    weak var parentVCRef: DidSwipePages?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = self
        delegate = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
    }

}

extension MainPageVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed
        {
            if let currentViewController = pageViewController.viewControllers?.first,
                let index = orderedViewControllers.index(of: currentViewController) {
                parentVCRef?.didSwipeToPage(with: index)
                
            }
        }
    }
    
    
}

extension MainPageVC: ActiveTabDelegate
{
    func choseTab(at index: Int) {
        setViewControllers([orderedViewControllers[index]], direction: .forward, animated: true, completion: nil)
    }
}
