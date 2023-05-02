//
//  MediaAndUtilitiesHeader.swift
//  Home Work 14
//
//  Created by Daniil Davidovich on 13.01.23.
//

import UIKit

class HeaderWithoutSeeAll: UICollectionReusableView {
        
    static let identifier = "MediaAndUtillitiesCellHeader"
    
    // MARK: - Outlets
    let lineLabel: UILabel = {
        let lineLabelRight = UILabel ()
        lineLabelRight.backgroundColor = .systemGray5
        lineLabelRight.layer.cornerRadius = 2
        lineLabelRight.translatesAutoresizingMaskIntoConstraints = false
        return lineLabelRight
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
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}
