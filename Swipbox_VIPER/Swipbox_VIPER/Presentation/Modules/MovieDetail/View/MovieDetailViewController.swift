//
//  MovieDetailViewController.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import UIKit

protocol MovieDetailViewProtocol: BaseViewProtocol {
}

class MovieDetailViewController: UIViewController, MovieDetailViewProtocol {
    
    //MARK: - UIElements
    let detailView: MovieDetailView = {
        let view = MovieDetailView(backgroundColor: .clear)
        view.setView()
        return view
    }()
    
    //MARK: - Variables
    var presenter: MovieDetailPresenterProtocol!
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setViewUI()
        presenter?.viewDidLoad()
    }
    
    
    //MARK: - Setup Methods
    func setViewUI() {
        addElementsToView()
    }
    
    fileprivate func addElementsToView() {
        view.addSubview(detailView)
        
        NSLayoutConstraint.activate([
            ///contentImageView
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
    
    //MARK: - MovieDetailViewProtocol
    func showData(_ isShow: Bool) {
        detailView.setData(presenter.movieData)
    }
}
