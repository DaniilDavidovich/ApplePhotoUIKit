//
//  PeopleCell.swift
//  Home Work 14
//
//  Created by Daniil Davidovich on 13.01.23.
//

import UIKit

class PeopleCell: UICollectionViewCell {
    
    static let identifier = "PeopleCell"
    
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
    
    private let imageOne: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageThree: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageFour: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40
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

        contentView.addSubview(imageOne)
        contentView.addSubview(imageTwo)
        contentView.addSubview(imageThree)
        contentView.addSubview(imageFour)
        contentView.addSubview(mainTitleLable)
        contentView.addSubview(valueOfPhoto)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            imageOne.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageOne.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageOne.widthAnchor.constraint(equalToConstant: 79),
            imageOne.heightAnchor.constraint(equalToConstant: 79),

            imageTwo.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageTwo.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageTwo.widthAnchor.constraint(equalToConstant: 79),
            imageTwo.heightAnchor.constraint(equalToConstant: 79),

            imageThree.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageThree.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            imageThree.widthAnchor.constraint(equalToConstant: 79),
            imageThree.heightAnchor.constraint(equalToConstant: 79),

            imageFour.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageFour.centerYAnchor.constraint(equalTo: imageThree.centerYAnchor),
            imageFour.widthAnchor.constraint(equalToConstant: 79),
            imageFour.heightAnchor.constraint(equalToConstant: 79),

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
        self.imageOne.image = UIImage(named: AlbumsModel.people[0])
        self.imageTwo.image = UIImage(named: AlbumsModel.people[1])
        self.imageThree.image = UIImage(named: AlbumsModel.people[2])
        self.imageFour.image = UIImage(named: AlbumsModel.people[3])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mainTitleLable.text = nil
        self.valueOfPhoto.text = nil
        self.imageOne.image = nil
        self.imageTwo.image = nil
        self.imageThree.image = nil
        self.imageFour.image = nil
    }
}
