//
//  ImageListViewController.swift
//  coding-test
//
//  Created by Yan Correa Trindade on 03/08/21.
//

import UIKit

enum ImageRowType {
    case ImageItemRow(viewModel: ImageTableViewCellViewModel)
}

class ImageListViewController: UIViewController {
    
    var uiController: ImageListView
    var viewModel: ImageListViewModel
    
    init(viewModel: ImageListViewModel) {
        self.viewModel = viewModel
        uiController = ImageListView()
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
        setupTableView()
        viewModel.loadData()
        viewModel.bind = { [unowned self] data in
            self.uiController.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        uiController.tableView.delegate = self
        uiController.tableView.dataSource = self
        uiController.tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.reuseIdentifier)
    }
    
}

extension ImageListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = viewModel.rows[indexPath.row]
        
        switch row {
        case .ImageItemRow(let viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.reuseIdentifier, for: indexPath) as? ImageTableViewCell else {
                fatalError("Failed to dequeue ImageTableViewCell")
            }
            cell.configure(with: viewModel)
            return cell
        }
    }
    
}

extension ImageListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickOnCell(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
