//
//  ViewController.swift
//  coding-test
//
//  Created by Yan Correa Trindade on 03/08/21.
//

import UIKit

class TabController: UITabBarController, UITabBarControllerDelegate {
    
    let controllers : [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabs()
    }
    
    func setupTabs() {
        let item1ViewModel = ImageListViewModel()
        let item1 = ImageListViewController(viewModel: item1ViewModel)
        item1.tabBarItem = UITabBarItem(title: "List", image: nil, selectedImage: nil)
        
        let item2 = ShowImageViewController()
        item2.tabBarItem = UITabBarItem(title: "Last", image: nil, selectedImage: nil)
        
        let item3 = ShowImageViewController()
        item3.tabBarItem = UITabBarItem(title: "B4 Last", image: nil, selectedImage: nil)
        
        let controllers = [item1, item2, item3]
        viewControllers = controllers
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let listVC = viewControllers?[0] as! ImageListViewController
        
        switch listVC.viewModel.itemsClicked.count {
        case 1:
            let lastVc = viewControllers?[1] as! ShowImageViewController
            lastVc.showImage(item: listVC.viewModel.itemsClicked[0])
        case 2:
            let lastVc = viewControllers?[1] as! ShowImageViewController
            lastVc.showImage(item: listVC.viewModel.itemsClicked[1])
            let previousVc = viewControllers?[2] as! ShowImageViewController
            previousVc.showImage(item: listVC.viewModel.itemsClicked[0])
        default:
            break
        }
    }
    
}

