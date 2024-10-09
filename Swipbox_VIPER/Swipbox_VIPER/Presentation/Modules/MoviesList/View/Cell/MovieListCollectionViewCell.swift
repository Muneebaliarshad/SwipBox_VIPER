//
//  MovieListCollectionViewCell.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import UIKit

class MovieListCollectionViewCell: CollectionViewCell {
    
    //MARK: - UIElements
    let dataView = CustomView(backgroundColor: .white, cornerRadius: 10.scaledToScreen)
    let contentImageView = CustomImageView(imageName: "Plceholder")
    let persentageLabel = CustomLabel(text: "0%", textColor: .white, font: .systemFont(ofSize: 8.scaledToScreen, weight: .medium), alignment: .center)
    let titleLabel = CustomLabel(text: "Movie Name", textColor: .black, font: .systemFont(ofSize: 12.scaledToScreen, weight: .heavy))
    let dateLabel = CustomLabel(text: "Movie Date", textColor: .gray, font: .systemFont(ofSize: 10.scaledToScreen, weight: .semibold))
    
    
    //MARK: - Nib Methods
    override func setViewUI() {
        addElementsToView()
        dataView.clipsToBounds = true
        setPersentageLabel()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentImageView.image = nil
    }
    
    
    fileprivate func addElementsToView() {
        addSubview(dataView)
        dataView.addSubview(contentImageView)
        dataView.addSubview(persentageLabel)
        dataView.addSubview(titleLabel)
        dataView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            ///dataView
            dataView.topAnchor.constraint(equalTo: topAnchor),
            dataView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dataView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dataView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            ///contentImageView
            contentImageView.topAnchor.constraint(equalTo: dataView.topAnchor),
            contentImageView.leadingAnchor.constraint(equalTo: dataView.leadingAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: dataView.trailingAnchor),
            contentImageView.heightAnchor.constraint(equalTo: dataView.heightAnchor, multiplier: 0.8),
            
            ///persentageLabel
            persentageLabel.centerYAnchor.constraint(equalTo: contentImageView.bottomAnchor),
            persentageLabel.leadingAnchor.constraint(equalTo: contentImageView.leadingAnchor, constant: 5.scaledToScreen),
            persentageLabel.heightAnchor.constraint(equalToConstant: 30.scaledToScreen),
            persentageLabel.widthAnchor.constraint(equalToConstant: 30.scaledToScreen),
            
            ///titleLabel
            titleLabel.topAnchor.constraint(equalTo: persentageLabel.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentImageView.leadingAnchor, constant: 5.scaledToScreen),
            titleLabel.trailingAnchor.constraint(equalTo: contentImageView.trailingAnchor),
            
            ///dateLabel
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: dataView.bottomAnchor, constant: -10),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 5.scaledToScreen),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
        ])
        
        applyShadow(color: .gray)
    }
    
    // MARK: - Setup Method
    func setPersentageLabel() {
        persentageLabel.backgroundColor = .black
        persentageLabel.clipsToBounds = true
        persentageLabel.layer.cornerRadius = 15.scaledToScreen
        persentageLabel.layer.borderWidth = 2.scaledToScreen
        persentageLabel.layer.borderColor = UIColor.white.cgColor
    }
    
    func setData(_ data: Movie) {
        if let imageUrl = data.posterPath {
            ImageDownloadService.getImage(urlString: AppConfiguration.shared.imageBaseURL + imageUrl) { [weak self] image in
                self?.contentImageView.image = image
            }
        } else {
            self.contentImageView.image = UIImage(named: "Logo")
        }
        let persentage = Int(((data.voteAverage) / 10.0) * 100)
        persentageLabel.text = "\(persentage)%"
        titleLabel.text = data.title
        dateLabel.text = data.releaseDate
    }
}
