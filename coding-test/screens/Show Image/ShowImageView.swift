//
//  ShowImageView.swift
//  coding-test
//
//  Created by Yan Correa Trindade on 03/08/21.
//

import UIKit

class ShowImageView: UIView {
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShowImageView: RenderViewProtocol {
    func buildViewHierarchy() {
        addSubview(myImageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            myImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            myImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            myImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func additionalViewSetup() {
        backgroundColor = .white
    }
    
}
