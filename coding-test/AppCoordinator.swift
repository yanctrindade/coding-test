//
//  AppCoordinator.swift
//  coding-test
//
//  Created by Yan Correa Trindade on 03/08/21.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private var presenter: UINavigationController
    private var window: UIWindow
    private weak var appDelegate: AppDelegate?
    
    init(appDelegate: AppDelegate, window: UIWindow) {
        self.appDelegate = appDelegate
        self.window = window
        self.presenter = UINavigationController()
    }
    
    func start() {
        let tabcontroller = TabController()
        self.presenter = UINavigationController(rootViewController: tabcontroller)
        self.appDelegate?.window = self.window
        window.rootViewController = presenter
        window.makeKeyAndVisible()
    }
    
}
