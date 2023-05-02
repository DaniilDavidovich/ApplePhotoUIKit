//
//  RecentlyDeletedCell.swift
//  Home Work 14
//
//  Created by Daniil Davidovich on 16.01.23.
//

import UIKit

class RecentlyDeletedCell: UICollectionViewCell {
    
    static let identifier = "UtilitiesRecentlyCell"
    
    // MARK: - Outlets
    
    let lineLabel: UILabel = {
        let lineLabelRight = UILabel ()
        lineLabelRight.backgroundColor = .systemGray5
        lineLabelRight.layer.cornerRadius = 2
        lineLabelRight.translatesAutoresizingMaskIntoConstraints = false
        return lineLabelRight
    }()
    
    private lazy var imageRightSite: UIImageView = {
        let image = UIImage(systemName: "chevron.right")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var lockImageRightSite: UIImageView = {
        let image = UIImage(systemName: "lock.fill")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var mainTitleLable: UILabel = {
        let label = UILabel()
        
        if #available(iOS 16.0, *) {
            label.font = .systemFont(ofSize: 20, weight: .regular, width: .standard)
        } else {
            label.font = .systemFont(ofSize: 20, weight: .regular)
        }
        
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
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
        contentView.addSubview(lineLabel)
        contentView.addSubview(imageRightSite)
        contentView.addSubview(lockImageRightSite)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            lockImageRightSite.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            lockImageRightSite.trailingAnchor.constraint(equalTo: imageRightSite.leadingAnchor, constant: -3),
            lockImageRightSite.widthAnchor.constraint(equalToConstant: 17),
            lockImageRightSite.heightAnchor.constraint(equalToConstant: 19),
            
            imageRightSite.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            imageRightSite.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -15),
            imageRightSite.heightAnchor.constraint(equalToConstant: 16),
            imageRightSite.widthAnchor.constraint(equalToConstant: 10),
            
            lineLabel.leadingAnchor.constraint(equalTo: mainTitleLable.leadingAnchor, constant: 0),
            lineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lineLabel.heightAnchor.constraint(equalToConstant: 1),
            lineLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -17),
        
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 5.5),
            image.heightAnchor.constraint(equalToConstant: 26),
            image.widthAnchor.constraint(equalToConstant: 30),
            
            mainTitleLable.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            mainTitleLable.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20)
        ])
    }
    
    // MARK: - Configuration
    
    func configuration(model: AlbumsModel) {
        self.mainTitleLable.text = model.mainTitle
        self.image.image = UIImage(systemName: model.image ?? "")
        
        if mainTitleLable.text == "Imports" || mainTitleLable.text == "Videos"{
            lineLabel.backgroundColor = .white
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        self.mainTitleLable.text = nil
    }
}
