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
    public func showAlert(title: String = "Ixi......",
                          message: String = "Error inesperado",
                          completion: @escaping () -> Void = {}) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            completion()
        }))
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true, completion: nil)
        }
    }
}

