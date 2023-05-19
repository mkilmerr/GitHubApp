//
//  SearchUserTableViewDelegate.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 19/05/23.
//

import UIKit

class SearchUserTableViewDelegate: NSObject, UITableViewDelegate {
    private var view: SearchUserView
    
    init(_ view: SearchUserView) {
        self.view = view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
