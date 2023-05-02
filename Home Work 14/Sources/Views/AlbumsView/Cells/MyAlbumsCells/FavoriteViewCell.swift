//
//  FavoriteViewCell.swift
//  Home Work 14
//
//  Created by Daniil Davidovich on 16.01.23.
//

import UIKit

class FavoriteViewCell: UICollectionViewCell {
    
    static let identifier = "FavoriteCell"
    
    // MARK: - Outlets
    
    private lazy var valueOfPhoto: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mainTitleLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var imageHeart: UIImageView = {
        let image = UIImage(systemName: "heart.fill")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        
        contentView.addSubview(image)
        contentView.addSubview(mainTitleLable)
        contentView.addSubview(valueOfPhoto)
        contentView.addSubview(imageHeart)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            imageHeart.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageHeart.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -5),
            imageHeart.heightAnchor.constraint(equalToConstant: 20),
            imageHeart.widthAnchor.constraint(equalToConstant: 20),
            
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            
            valueOfPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            valueOfPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            mainTitleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainTitleLable.bottomAnchor.constraint(equalTo: valueOfPhoto.topAnchor)
        ])
    }
    
    // MARK: - Configuration
    
    func configuration(model: AlbumsModel) {
        self.mainTitleLable.text = model.mainTitle
        self.valueOfPhoto.text = model.valueOfPhoto
        self.image.image = UIImage(named: model.image ?? "")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        self.valueOfPhoto.text = nil
        self.mainTitleLable.text = nil
        self.imageHeart.image = nil
    }

}
