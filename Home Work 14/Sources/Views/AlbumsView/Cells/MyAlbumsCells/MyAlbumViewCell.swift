//
//  MyAlbumViewCell.swift
//  Home Work 14
//
//  Created by Daniil Davidovich on 12.01.23.
//

import UIKit

class MyAlbumViewCell: UICollectionViewCell {
    
    static let identifier = "MyAlbumCell"
    
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
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            
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
    }
}
