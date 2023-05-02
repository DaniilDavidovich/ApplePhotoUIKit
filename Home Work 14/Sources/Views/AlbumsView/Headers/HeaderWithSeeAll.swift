//
//  AlbumCellHeaderCollectionReusableView.swift
//  Home Work 14
//
//  Created by Daniil Davidovich on 12.01.23.
//

import UIKit

class HeaderWithSeeAll: UICollectionReusableView {
    
    static let identifier = "AlbumCellHeader"
    
    // MARK: - Outlets
    let lineLabel: UILabel = {
        let lineLabelRight = UILabel ()
        lineLabelRight.backgroundColor = .systemGray5
        lineLabelRight.layer.cornerRadius = 2
        lineLabelRight.translatesAutoresizingMaskIntoConstraints = false
        return lineLabelRight
    }()
    
    private lazy var buttonSeeAll: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See All", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(title)
        addSubview(lineLabel)
        addSubview(buttonSeeAll)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 50),
            
            lineLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            lineLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineLabel.heightAnchor.constraint(equalToConstant: 1),
            lineLabel.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -10),
            
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: lineLabel.leadingAnchor),
            
            buttonSeeAll.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            buttonSeeAll.centerYAnchor.constraint(equalTo: title.centerYAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}
