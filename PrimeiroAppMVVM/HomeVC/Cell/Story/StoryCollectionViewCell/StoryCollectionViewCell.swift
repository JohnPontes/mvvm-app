//
//  StoryCollectionViewCell.swift
//  PrimeiroAppMVVM
//
//  Created by John Pontes on 13/12/22.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoryCollectionViewCell"
    
    private var screen: StoryCollectionViewCellScreen = StoryCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(contentView)
    }
    
    public func setupCell(data: Stories, indexPath: IndexPath) {
        screen.profileImageView.image = UIImage(named: data.image ?? "")
        screen.userNameLabel.text = data.userName
        screen.addButton.isHidden = indexPath.row == 0 ? false : true
    }
    
}
