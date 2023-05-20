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
        label.font = UIFont.boldSystemFont(ofSize: 30)
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
    
    private lazy var repositoriesTitleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.text = "Repositórios"
        label.textColor = UIColor.accentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    public func setUserImage(_ avatarURL: String) {
        userImageView.loadImage(with: avatarURL)
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
        backgroundColor = UIColor.customGray
        addSubview(userImageView)
        addSubview(loginNameLabel)
        addSubview(followersFollowingStackView)
        addSubview(repositoriesTitleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loginNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                                constant: 10),
            loginNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                    constant: 16)
        ])
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: loginNameLabel.bottomAnchor, constant: 20),
            userImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            userImageView.widthAnchor.constraint(equalToConstant: 200),
            userImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([
            followersFollowingStackView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 20),
            followersFollowingStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            repositoriesTitleLabel.topAnchor.constraint(equalTo: followersFollowingStackView.bottomAnchor, constant: 20),
            repositoriesTitleLabel.leadingAnchor.constraint(equalTo: loginNameLabel.leadingAnchor)
        ])
    }
    
    func configureView() {
        setupView()
        setupConstraints()
    }
}
