//
//  UserDetailView.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import UIKit

class UserDetailView: UIView {
    
    var repos: [Repos]? {
        didSet {
            reloadCollectionView()
        }
    }
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
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor.accentColor
        label.text = "Repositórios"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataSource = UserDetailCollectionViewDataSource(self)
    private lazy var delegate = UserDetailCollectionViewDelegate()
    
    private(set) lazy var reposCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/1.2,
                                 height: UIScreen.main.bounds.width/2)
        
        let collectionView = UICollectionView(frame: frame,
                                              collectionViewLayout: layout)
        collectionView.register(UserDetailRepositoryCollectionViewCell.self,
                                forCellWithReuseIdentifier: UserDetailRepositoryCollectionViewCell.identifier)
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.allowsMultipleSelection = false
        collectionView.isScrollEnabled = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
    
    private func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            self?.reposCollectionView.reloadData()
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
        addSubview(reposCollectionView)
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
        NSLayoutConstraint.activate([
            reposCollectionView.topAnchor.constraint(equalTo: repositoriesTitleLabel.bottomAnchor, constant: 10),
            reposCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            reposCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            reposCollectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0),
            reposCollectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureView() {
        setupView()
        setupConstraints()
    }
}
