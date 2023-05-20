//
//  UserDetailRepositoryCollectionViewCell.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import UIKit

class UserDetailRepositoryCollectionViewCell: UICollectionViewCell {
    static var identifier: String { return String(describing: self)}

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor.accentColor
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var  descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.accentColor
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }

    func configure(with repo: Repos?) {
        guard let repo = repo else { return }
        titleLabel.text = repo.fullName
        descriptionLabel.text = repo.description
    }
}

extension UserDetailRepositoryCollectionViewCell: ViewConfiguration {
    func setupView() {
        backgroundColor = .lightGray
        contentView.addSubview(stackView)

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func configureView() {
        setupView()
        setupConstraints()
    }
}
