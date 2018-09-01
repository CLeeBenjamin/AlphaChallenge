//
//  FourPagesPageViewController.swift
//  AlphaCodeChallenge
//
//  Created by Caston  Boyd on 8/31/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import UIKit

class FourPageViewController: UIPageViewController {

    //MARK: - Grab each View Controller
    
     lazy var eachPage: [UIViewController] = {
        
        return [self.retrievedVC(withId: "RealNumberStoryBoard"),
                self.retrievedVC(withId: "InternationalAccessStoryBoard"),
                self.retrievedVC(withId: "CompletelyAnon"),
                self.retrievedVC(withId: "ZeroAds") ]
    }()
    
   private func retrievedVC(withId identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .instantiateViewController(withIdentifier: identifier)
    }
    
    private func configurePageControl() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.hidesForSinglePage = true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePageControl()
        
        dataSource = self
        delegate = self
        
        
        
        if let firstVC = eachPage.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    
   
    }
    
    
    
    
}

extension FourPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = eachPage.index(of: viewController) else { return nil }
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else { return nil}
        guard eachPage.count > previousIndex else { return nil }

        return eachPage[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = eachPage.index(of: viewController) else { return nil}
        let nextIndex = vcIndex + 1
        let eachPageCount = eachPage.count
        guard eachPageCount != nextIndex else { return nil }
        guard eachPageCount > nextIndex else { return nil}
        
        
        return eachPage[nextIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
   
        }
    }




