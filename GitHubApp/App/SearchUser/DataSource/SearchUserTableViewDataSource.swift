//
//  SearchUserTableViewDataSource.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import UIKit

class SearchUserTableViewDataSource: NSObject, UITableViewDataSource {
    
    private var view: SearchUserView
    
    init(_ view: SearchUserView) {
        self.view = view
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return view.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchUserTableViewCell.identifier) as? SearchUserTableViewCell else { return UITableViewCell() }
        let user = view.users?[indexPath.section]
        cell.configure(with: user)
        return cell
    }
    
}
