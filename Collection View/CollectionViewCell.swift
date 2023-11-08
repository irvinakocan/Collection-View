//
//  CollectionViewCell.swift
//  Collection View
//
//  Created by Macbook Air 2017 on 8. 11. 2023..
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 1
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = CGRect(x: 5,
                                 y: 5,
                                 width: contentView.frame.size.width - 10,
                                 height: contentView.frame.size.height - 5 - 50)
        nameLabel.frame = CGRect(x: 5,
                                 y: contentView.frame.size.height - 50,
                                 width: contentView.frame.size.width - 10,
                                 height: 50)
    }
    
    public func configure(with princess: Princess) {
        imageView.image = UIImage(named: princess.imageName)
        nameLabel.text = princess.name
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        nameLabel.text = nil
    }
}
