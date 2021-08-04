//
//  ShowImageViewController.swift
//  coding-test
//
//  Created by Yan Correa Trindade on 03/08/21.
//

import Foundation
import UIKit

class ShowImageViewController: UIViewController {
    
    var uiController: ShowImageView
    
    init() {
        uiController = ShowImageView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = uiController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showImage(item: ImageItem) {
        uiController.myImageView.setImage(from: item.url)
    }
    
}
