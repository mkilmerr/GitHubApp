//
//  SearchUserViewController.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import UIKit

class SearchUserViewController: UIViewController {
    private let customView = SearchUserView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
    }
}
