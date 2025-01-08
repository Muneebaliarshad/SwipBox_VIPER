//
//  MoviesListViewController.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import UIKit

protocol MoviesListViewProtocol: BaseViewProtocol {
}

class MoviesListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, MoviesListViewProtocol {
    
    //MARK: - UIElements
    var collectionView : CustomCollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .vertical
        
        let cv = CustomCollectionView(layout: layout)
        cv.register(MovieListCollectionViewCell.self, forCellWithReuseIdentifier: MovieListCollectionViewCell.identifier)
        cv.accessibilityIdentifier = "moviesCollectionView"
        return cv
    }()
    let titleLabel = CustomLabel(text: "No Data Found", textColor: .label, font: .systemFont(ofSize: 15.scaledToScreen, weight: .heavy), alignment: .center)
    lazy var retryButton : CustomButton = {
        let button = CustomButton(textKey: "Try Again", font: .systemFont(ofSize: 15), backgroundColor: .black, textColor: .white, cornerRadius: 20, borderColor: .white, borderWidth: 2)
        button.addTarget(self, action: #selector(retryButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    
    //MARK: - Variables
    var presenter: MoviesListPresenterProtocol!
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad()
    }
    
    
    //MARK: - Setup Methods
    private func setupView() {
        navigationItem.title = "Movies"
        view.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        addElementsToView()
    }
    
    fileprivate func addElementsToView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            ///collectionView
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    fileprivate func addNoDataToView() {
        collectionView.removeFromSuperview()
        view.addSubview(titleLabel)
        view.addSubview(retryButton)
        
        NSLayoutConstraint.activate([
            ///titleLabel
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            ///retryButton
            retryButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            retryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            retryButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            retryButton.heightAnchor.constraint(equalToConstant: 40.scaledToScreen),
        ])
    }
    
    
    //MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.moviesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCollectionViewCell.identifier, for: indexPath) as! MovieListCollectionViewCell
        cell.setData(presenter.moviesData[indexPath.item])
        return cell
    }
    
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.navigateToMovieDetail(index: indexPath.item)
    }
    
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 20, height: (collectionView.frame.height / 2.5))
    }
    
    
    //MARK: - MoviesListViewProtocol
    func showData(_ isShow: Bool) {
        DispatchQueue.main.async {
            if isShow {
                self.collectionView.reloadData()
            } else {
                self.addNoDataToView()
            }
        }
    }
    
    //MARK: - Selectors
    @objc func retryButtonPressed() {
        presenter?.viewDidLoad()
    }
}
