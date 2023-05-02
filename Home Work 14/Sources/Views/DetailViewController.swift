//
//  DetailViewCell.swift
//  Home Work 14
//
//  Created by Daniil Davidovich on 14.01.23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var cell: AlbumsModel? {
        didSet {
            if cell?.mainTitle == "People" {
                if traitCollection.userInterfaceStyle == .dark {
                    image.image = UIImage(named: "PeoplesDark")
                    label.text = cell?.mainTitle ?? ""
                } else {
                    image.image = UIImage(named: "Peoples")
                    label.text = cell?.mainTitle ?? ""
                }
            } else {
                image.image = UIImage(named: (cell?.image)!) ?? UIImage(systemName: (cell?.image ?? ""))
                image.tintColor = .systemBlue
                label.text = cell?.mainTitle ?? ""
            }
        }
    }
    
    //MARK: - Outlets
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 7
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.tintColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Setups
    
    private func setupView() {
        if traitCollection.userInterfaceStyle == .dark {
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .white
        }
    }
    
    private func setupHierarchy() {
        view.addSubview(image)
        view.addSubview(label)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.heightAnchor.constraint(equalToConstant: 200),
            
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 15),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
