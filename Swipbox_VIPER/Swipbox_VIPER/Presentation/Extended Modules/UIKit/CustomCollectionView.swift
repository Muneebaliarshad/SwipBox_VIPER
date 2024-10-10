//
//  CollectionView.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import UIKit

//MARK: - UICollectionView
class CustomCollectionView: UICollectionView {
    
    // MARK: - Init Methods
    required init(layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()) {
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func configureCollectionView() {
        backgroundColor = .clear
        contentInsetAdjustmentBehavior = .never
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
}

//MARK: - UICollectionViewCell
class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .clear
        setViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Open Methods for UI Setup
    open func setViewUI() {
    }
}
