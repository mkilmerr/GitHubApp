//
//  UserDetailCollectionViewDataSource.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import UIKit

class UserDetailCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private var view: UserDetailView
    
    init(_ view: UserDetailView) {
        self.view = view
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return view.repos?.count ?? 0 
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserDetailRepositoryCollectionViewCell.identifier, for: indexPath) as? UserDetailRepositoryCollectionViewCell else { return UICollectionViewCell() }
        let repo = view.repos?[indexPath.item]
        cell.configure(with: repo)
        return cell
    }
}
