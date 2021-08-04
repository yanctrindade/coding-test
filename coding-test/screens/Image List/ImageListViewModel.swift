//
//  ImageListViewModel.swift
//  coding-test
//
//  Created by Yan Correa Trindade on 03/08/21.
//

import Foundation

class ImageListViewModel {
    
    private let apiClient = ImagesAPIClient()
    var imageItems: [ImageItem] = [] {
        didSet {
            updateRows()
        }
    }
    var rows: [ImageRowType] = [] {
        didSet {
            bind?(rows)
        }
    }
    var bind: (([ImageRowType]?) -> Void)?
    var itemsClicked: [ImageItem] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        apiClient.fetchImages { result in
            switch result {
            case .success(let images):
                self.imageItems = images
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func updateRows() {
        let imagesViewModels = imageItems.map { ImageTableViewCellViewModel(item: $0) }
        rows = imagesViewModels.map { ImageRowType.ImageItemRow(viewModel: $0) }
    }
    
    func didClickOnCell(indexPath: IndexPath) {
        let lastImageClicked = imageItems[indexPath.row]
        
        switch itemsClicked.count {
        case 0:
            itemsClicked.append(lastImageClicked)
        case 1:
            itemsClicked.append(lastImageClicked)
        case 2:
            itemsClicked[0] = itemsClicked[1]
            itemsClicked[1] = lastImageClicked
        default:
            break
        }
    }
    
}
