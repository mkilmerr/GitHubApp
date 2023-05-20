//
//  SearchUserView.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import UIKit

protocol SearchUserViewDelegate: AnyObject {
    func cellDidSelect()
    func searchUser(with name: String)
}
class SearchUserView: UIView {
    // MARK: - Properties
    weak var delegate: SearchUserViewDelegate?
    
    var users: UserCard? {
        didSet {
            reloadTableView()
        }
    }
    // MARK: - Dynamic constraints
    private var searchTextFieldTopConstraint: NSLayoutConstraint!
    
    // MARK: - Delegate/DataSource
    private lazy var searchTextFieldDelegate = SearchUserTextFieldDelegate(self)
    private lazy var searchTableViewDataSource = SearchUserTableViewDataSource(self)
    private lazy var searchTableViewDelegate = SearchUserTableViewDelegate(self)
    
    // MARK: - UI Elements
    private(set) lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite..."
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.customGray?.cgColor
        textField.delegate = searchTextFieldDelegate
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var usersTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchUserTableViewCell.self,
                           forCellReuseIdentifier: SearchUserTableViewCell.identifier)
        tableView.delegate = searchTableViewDelegate
        tableView.dataSource = searchTableViewDataSource
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
// MARK: - TableView Configuration
extension SearchUserView {
    private func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.usersTableView.reloadData()
        }
    }
}
// MARK: - Update UI Functions
extension SearchUserView {
    public func searchTextFieldDidTapAnimation() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.scaleUpTextField()
        }
        layoutIfNeeded()
    }
    private func scaleUpTextField() {
        searchTextField.transform = CGAffineTransform(scaleX: 0.9,
                                                           y: 0.9)
    }
    private func scaleDownTextField() {
        searchTextField.transform = CGAffineTransform(scaleX: 1.0,
                                                      y: 1.0)
    }
    public func searchTextFieldDidReturn() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.scaleDownTextField()
        }
        layoutIfNeeded()
    }
}
// MARK: - ViewConfiguration
extension SearchUserView: ViewConfiguration {
    func setupView() {
        backgroundColor = UIColor.accentColor
        addSubview(searchTextField)
        addSubview(usersTableView)
    }
    
    func setupConstraints() {
        searchTextFieldTopConstraint = searchTextField
            .topAnchor
            .constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                        constant: 40)
        searchTextFieldTopConstraint.isActive = true
        
        NSLayoutConstraint.activate([
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
        
        NSLayoutConstraint.activate([
            usersTableView
                .topAnchor
                .constraint(equalTo: searchTextField.bottomAnchor,
                                                constant: 30),
            usersTableView
                .leadingAnchor
                .constraint(equalTo: leadingAnchor,
                            constant: 16),
            trailingAnchor
                .constraint(equalTo: usersTableView.trailingAnchor,
                            constant: 16),
            usersTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    func configureView() {
        setupView()
        setupConstraints()
    }
}
