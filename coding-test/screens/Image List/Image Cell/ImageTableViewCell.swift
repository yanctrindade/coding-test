//
//  ImageTableViewCell.swift
//  coding-test
//
//  Created by Yan Correa Trindade on 04/08/21.
//

import UIKit

struct ImageTableViewCellViewModel {
    let url: URL

    init(item: ImageItem) {
        url = item.url
    }
}

class ImageTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        myImageView.image = nil
    }
    
    func configure(with viewModel: ImageTableViewCellViewModel) {
        myImageView.setImage(from: viewModel.url)
    }

}

extension ImageTableViewCell: RenderViewProtocol {
    func buildViewHierarchy() {
        addSubview(myImageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            myImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func additionalViewSetup() {
        selectionStyle = .default
    }
    
}
