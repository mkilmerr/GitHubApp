//
//  BaseViewController.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import UIKit

class BaseViewController: UIViewController {
    private var indicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
// MARK: - Indicator Configuration
extension BaseViewController {
    private func configureIndicator() {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    public func startAnimating() {
        configureIndicator()
        indicator.startAnimating()
    }
    
    public func stopAnimating() {
        DispatchQueue.main.async { [weak self] in
            self?.indicator.removeFromSuperview()
            self?.indicator.stopAnimating()
        }
    }
}

