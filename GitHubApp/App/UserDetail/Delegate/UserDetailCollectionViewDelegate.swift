//
//  UserDetailCollectionViewDelegate.swift
//  GitHubApp
//
//  Created by Marcos Kilmer  on 20/05/23.
//

import UIKit

class UserDetailCollectionViewDelegate: NSObject,
                                        UICollectionViewDelegate,
                                        UICollectionViewDelegateFlowLayout {
    
    private let itemsPerRow: CGFloat = 5
    private(set) lazy var sectionInsets = UIEdgeInsets(
        top: 16,
        left: 16,
        bottom: 16,
        right: 16)
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
       
    }

}
