//
//  SearchUserView.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import UIKit

class SearchUserView: UIView {
    private(set) lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite..."
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
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
        addSubview(searchTextField)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchTextField
                .heightAnchor
                .constraint(equalToConstant: ViewMetrics.TextField.height),
            trailingAnchor
                .constraint(equalTo: searchTextField.trailingAnchor,
                            constant: ViewMetrics.TextField.trailing),
            searchTextField
                .leadingAnchor
                .constraint(equalTo: leadingAnchor,
                            constant: ViewMetrics.TextField.leading)
        ])
    }
}
