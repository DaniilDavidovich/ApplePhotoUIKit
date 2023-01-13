//
//  ViewController.swift
//  Home Work 14
//
//  Created by Daniil Davidovich on 12.01.23.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    //MARK: - Outlets
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
       
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: Headers
        collection.register(AlbumsCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AlbumsCellHeader.identifier)
        collection.register(HeaderWithoutSeeAll.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderWithoutSeeAll.identifier)
        
        //MARK: Cell
        collection.register(MyAlbumViewCell.self, forCellWithReuseIdentifier: MyAlbumViewCell.identifier)
        collection.register(MediAndUtilitiesCell.self, forCellWithReuseIdentifier: MediAndUtilitiesCell.identifier)
        collection.register(PeopleCell.self, forCellWithReuseIdentifier: PeopleCell.identifier)
        
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarhy()
        setupLayout()
    }
    
    //MARK: - Setups
    
    private func setupView() {
        title = "Albums"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(addTapped))
        
    }
    
    private func setupHierarhy() {
        view.addSubview(collectionView)
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    //MARK: - Layout setup
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2), // width items
                                                       heightDimension: .fractionalWidth(1 / 1.8 * 2)) // hight items
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(80)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 0,
                                                                      bottom: 0,
                                                                      trailing: 0)
                
                
                return layoutSection
            case 1,2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2), // width items
                                                       heightDimension: .fractionalWidth(1 / 1.8 )) // hight items
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 1)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(80)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 0,
                                                                      bottom: 20,
                                                                      trailing: 0)
                
                return layoutSection

            default:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(44))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 30, trailing: 10)
                
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(80)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 0,
                                                                      bottom: 20,
                                                                      trailing: 0)
                
                return layoutSection
            }
        }
    }
}


//MARK: - Extension

extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        AlbumsModel.modelsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AlbumsModel.modelsArray[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumViewCell.identifier, for: indexPath) as! MyAlbumViewCell
            item.configuration(model: AlbumsModel.modelsArray[indexPath.section][indexPath.item])
            return item
        case 1:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumViewCell.identifier, for: indexPath) as! MyAlbumViewCell
            item.configuration(model: AlbumsModel.modelsArray[indexPath.section][indexPath.item])
            return item
        case 2:
            
            switch indexPath.item {
            case 0:
                let item = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCell.identifier, for: indexPath) as! PeopleCell
                item.configuration(model: AlbumsModel.modelsArray[indexPath.section][indexPath.item])
                return item
            case 1:
                let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumViewCell.identifier, for: indexPath) as! MyAlbumViewCell
                
                item.configuration(model: AlbumsModel.modelsArray[indexPath.section][indexPath.item])
                return item
            default:
                let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumViewCell.identifier, for: indexPath) as! MyAlbumViewCell
                item.configuration(model: AlbumsModel.modelsArray[indexPath.section][indexPath.item])
                return item
            }
            
        case 3:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MediAndUtilitiesCell.identifier, for: indexPath) as! MediAndUtilitiesCell
            item.configuration(model: AlbumsModel.modelsArray[indexPath.section][indexPath.item])
            return item
        case 4:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MediAndUtilitiesCell.identifier, for: indexPath) as! MediAndUtilitiesCell
            item.configuration(model: AlbumsModel.modelsArray[indexPath.section][indexPath.item])
            return item
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediAndUtilitiesCell.identifier, for: indexPath)
            cell.backgroundColor = .systemGray
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumsCellHeader.identifier, for: indexPath) as! AlbumsCellHeader
            header.title.text = "My Albums"
            
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumsCellHeader.identifier, for: indexPath) as! AlbumsCellHeader
            header.title.text = "Shared Albums"
            return header
            
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderWithoutSeeAll.identifier, for: indexPath) as! HeaderWithoutSeeAll
            header.title.text = "People & Places"
            return header
        case 3:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderWithoutSeeAll.identifier, for: indexPath) as! HeaderWithoutSeeAll
            header.title.text = "Media Types"
            return header
        case 4:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderWithoutSeeAll.identifier, for: indexPath) as! HeaderWithoutSeeAll
            header.title.text = "Utilities"
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            return header
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
    
    
    @objc private func addTapped() {
        
    }
}

