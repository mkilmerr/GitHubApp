//
//  UserDetailView.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import UIKit

class UserDetailView: UIView {
    
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
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.accentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.accentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.accentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var followersFollowingStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [followersLabel, followingLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
}
// MARK: - View Configuration with Data
extension UserDetailView {
    public func setLoginName(_ name: String) {
        DispatchQueue.main.async { [weak self] in
            self?.loginNameLabel.text = name
        }
    }
    public func setFollowersAmount(_ amount: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.followersLabel.text = "\(amount) seguidores"
        }
    }
    public func setFollowingAmount(_ amount: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.followingLabel.text = "\(amount) amigos"
        }
    }
}
// MARK: - View Configuration
extension UserDetailView: ViewConfiguration {
    func setupView() {
        backgroundColor = .white
        addSubview(userImageView)
        addSubview(loginNameLabel)
        addSubview(followersFollowingStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userImageView.widthAnchor.constraint(equalToConstant: 100),
            userImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            loginNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            loginNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            followersFollowingStackView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 20),
            followersFollowingStackView.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor)
        ])
    }
    
    func configureView() {
        setupView()
        setupConstraints()
    }
}
