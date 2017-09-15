//
//  SliderImagesPageViewController.swift
//  ecommerce
//
//  Created by Octavianus Gandajaya on 9/12/17.
//  Copyright © 2017 Octavianus Gandajaya. All rights reserved.
//

import UIKit

protocol SliderImagesPageViewControllerDelegate: class{

    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
    
}

class SliderImagesPageViewController: UIPageViewController{
    
    var images: [UIImage]? 
    
    
    weak var pageViewDelegate: SliderImagesPageViewControllerDelegate?
    
    struct Storyboard {
        static let sliderImageViewController = "sliderImageViewController"
    }
    
    
    lazy var controllers: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers = [UIViewController]()
        
        if let images = self.images{
            for image in images{
                let sliderImageVC = storyboard.instantiateViewController(withIdentifier: SliderImagesPageViewController.Storyboard.sliderImageViewController)
                controllers.append(sliderImageVC)
            }
        }
        
        self.pageViewDelegate?.setupPageController(numberOfPages: controllers.count)
        
        return controllers
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        
        dataSource = self
        delegate = self
        
        self.turnToPage(index: 0)
    }

    func turnToPage(index: Int){
        let controller = controllers[index]
        var direction = UIPageViewControllerNavigationDirection.forward
        
        if let currectVC = viewControllers?.first{
            let currentIndex = controllers.index(of: currectVC)
            
            if currentIndex! > index{
               direction = .reverse
            }
        }
        
        self.configureDisplaying(viewController: controller)
        
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    
    }
    
    func configureDisplaying(viewController: UIViewController){
        for (index,vc) in  controllers.enumerated(){
            if viewController === vc{
                if let sliderImageVC = viewController as? SliderImageController{
                    sliderImageVC.image = self.images?[index]
                    self.pageViewDelegate?.turnPageController(to: index )
                }
            }
        
        }
    }//end func

}

// MARK: - IMPLEMENT DELEGATE + DATASOURCE

extension SliderImagesPageViewController:UIPageViewControllerDataSource {

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController){
            if index > 0 {
                return controllers[index  - 1 ]
            }
        }
        
        return controllers.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController){
            if index < controllers.count - 1 {
                return controllers[index + 1]
            }
        }
        
        return controllers.first
    }
    
}


extension SliderImagesPageViewController:UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: pendingViewControllers.first as! SliderImageController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed{
            self.configureDisplaying(viewController: previousViewControllers.first as! SliderImageController)
        }
    }
}





