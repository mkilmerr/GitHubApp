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
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var loginNameLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "login name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.accentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var followersImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followersLabel, followingLabel])
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor.accentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor.accentColor
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
    public func configure(with user: User?,
                          informations: UserInformations) {
        guard let user = user else { return }
        loginNameLabel.text = user.login
        followingLabel.text = "\(informations.following) amigos"
        followersLabel.text = "\(informations.followers) seguidores"
        userImageView.loadImage(with: user.avatarURL)
    }
}
// MARK: - View Configuration
extension SearchUserTableViewCell: ViewConfiguration {
    func setupView() {
        layer.cornerRadius = 16
        selectionStyle = .none
        backgroundColor = UIColor.customGray
        addSubview(userImageView)
        addSubview(loginNameLabel)
       addSubview(stackView)
       
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
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: loginNameLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: loginNameLabel.leadingAnchor)
        ])
    }
    
    func configureView() {
        setupView()
        setupConstraints()
    }
}
