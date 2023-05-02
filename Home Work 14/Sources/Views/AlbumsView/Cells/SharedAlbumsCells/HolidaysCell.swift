//
//  HolidaysCell.swift
//  Home Work 14
//
//  Created by Daniil Davidovich on 14.01.23.
//

import UIKit

class HolidaysCell: UICollectionViewCell {
    
    static let identifier = "HolidaysCell"

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
    
    private lazy var imageSmallView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 1.25
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    private lazy var imageCorner: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 0.2
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()
    
    private lazy var imageSmallView2: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 1.25
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    private lazy var imageCorner2: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 0.2
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()
    
    private lazy var imageSmallView3: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 1.25
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    private lazy var imageCorner3: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 0.2
        imageView.layer.borderColor = UIColor.black.cgColor
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
        contentView.addSubview(imageSmallView)
        contentView.addSubview(imageCorner)
        contentView.addSubview(imageSmallView2)
        contentView.addSubview(imageCorner2)
        contentView.addSubview(imageSmallView3)
        contentView.addSubview(imageCorner3)
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
            mainTitleLable.bottomAnchor.constraint(equalTo: valueOfPhoto.topAnchor),
            
            imageSmallView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            imageSmallView.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -7),
            imageSmallView.widthAnchor.constraint(equalToConstant: 40),
            imageSmallView.heightAnchor.constraint(equalToConstant: 40),
            
            imageCorner.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            imageCorner.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -7),
            imageCorner.widthAnchor.constraint(equalToConstant: 40),
            imageCorner.heightAnchor.constraint(equalToConstant: 40),
            
            imageSmallView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
            imageSmallView2.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -7),
            imageSmallView2.widthAnchor.constraint(equalToConstant: 40),
            imageSmallView2.heightAnchor.constraint(equalToConstant: 40),
            
            imageCorner2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
            imageCorner2.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -7),
            imageCorner2.widthAnchor.constraint(equalToConstant: 40),
            imageCorner2.heightAnchor.constraint(equalToConstant: 40),
            
            imageSmallView3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -65),
            imageSmallView3.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -7),
            imageSmallView3.widthAnchor.constraint(equalToConstant: 40),
            imageSmallView3.heightAnchor.constraint(equalToConstant: 40),
            
            imageCorner3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -65),
            imageCorner3.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -7),
            imageCorner3.widthAnchor.constraint(equalToConstant: 40),
            imageCorner3.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    // MARK: - Configuration
    
    func configuration(model: AlbumsModel) {
        self.mainTitleLable.text = model.mainTitle
        self.valueOfPhoto.text = model.valueOfPhoto
        self.image.image = UIImage(named: model.image ?? "")
        self.imageSmallView.image = UIImage(named: AlbumsModel.people[Int.random(in: 0...2)])
        self.imageSmallView2.image = UIImage(named: AlbumsModel.people[Int.random(in: 3...6)])
        self.imageSmallView3.image = UIImage(named: AlbumsModel.people[Int.random(in: 7...9)])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        self.valueOfPhoto.text = nil
        self.mainTitleLable.text = nil
        self.imageSmallView.image = nil
        self.imageSmallView2.image = nil
        self.imageSmallView3.image = nil
    }
}
