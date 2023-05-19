//
//  SearchUserView.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import UIKit

class SearchUserView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
        self.setupConstraints()
    }
}

// MARK: - ViewConfiguration
extension SearchUserView: ViewConfiguration {
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
    }
}
