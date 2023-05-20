//
//  SearchUserTableViewCell.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import UIKit

class SearchUserTableViewCell: UITableViewCell {
    static var identifier: String { return String(describing: self)}
    
    private lazy var userImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_github")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var loginNameLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "login name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var followersImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "45 seguidores"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
}
// MARK: - Configure Cell
extension SearchUserTableViewCell {
    public func configure(with user: User?) {
        guard let user = user else { return }
        loginNameLabel.text = user.login
        userImageView.loadImage(with: user.avatarURL)
    }
}
// MARK: - View Configuration
extension SearchUserTableViewCell: ViewConfiguration {
    func setupView() {
        layer.cornerRadius = 16
        selectionStyle = .none
        backgroundColor = .yellow
        addSubview(userImageView)
        addSubview(loginNameLabel)
       
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            userImageView.widthAnchor.constraint(equalToConstant: 100),
            userImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            loginNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            loginNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10)
        ])
    }
    
    func configureView() {
        setupView()
        setupConstraints()
    }
}
