//
//  RenderViewProtocol.swift
//  coding-test
//
//  Created by Yan Correa Trindade on 03/08/21.
//

import Foundation

protocol RenderViewProtocol {
    func buildViewHierarchy()
    func setupConstraints()
    func additionalViewSetup()
}

extension RenderViewProtocol {
    func setupViews() {
        buildViewHierarchy()
        setupConstraints()
        additionalViewSetup()
    }
}
