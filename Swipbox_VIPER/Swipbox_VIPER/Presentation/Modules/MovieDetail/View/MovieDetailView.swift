//
//  MovieDetailView.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import Foundation
import UIKit

class MovieDetailView: CustomImageView {
    //MARK: - UIElements
    let bannerImageView = CustomImageView(imageName: "Plceholder", accessibilityText: "bannerImageView")
    let shadowView = CustomView(backgroundColor: .black.withAlphaComponent(0.7 ))
    let dataImageView = CustomImageView(imageName: "Plceholder", cornerRadius: 10.scaledToScreen, accessibilityText: "dataImageView")
    let titleLabel = CustomLabel(text: "Movie Name", textColor: .label, font: .systemFont(ofSize: 15.scaledToScreen, weight: .heavy), accessibilityText: "titleLabel")
    let yearLabel = CustomLabel(text: "0000", textColor: .systemGray, font: .systemFont(ofSize: 13.scaledToScreen, weight: .regular), accessibilityText: "yearLabel")
    let persentageLabel = CustomLabel(text: "0%", textColor: .systemBackground, font: .systemFont(ofSize: 10.scaledToScreen, weight: .medium), alignment: .center, accessibilityText: "persentageLabel")
    let overviewTitleLabel = CustomLabel(text: "Overview: ", textColor: .label, font: .systemFont(ofSize: 15.scaledToScreen, weight: .bold))
    let overviewLabel = CustomLabel(text: "0000", textColor: .systemGray, font: .systemFont(ofSize: 15.scaledToScreen, weight: .regular), numberOfLines: 0, accessibilityText: "overviewLabel")
    let budgetTitleLabel = CustomLabel(text: "Budget: ", textColor: .label, font: .systemFont(ofSize: 15.scaledToScreen, weight: .bold))
    let budgetLabel = CustomLabel(text: "0000", textColor: .systemGray, font: .systemFont(ofSize: 15.scaledToScreen, weight: .regular), accessibilityText: "budgetLabel")
    let revenueTitleLabel = CustomLabel(text: "Revenue: ", textColor: .label, font: .systemFont(ofSize: 15.scaledToScreen, weight: .bold))
    let revenueLabel = CustomLabel(text: "0000", textColor: .systemGray, font: .systemFont(ofSize: 15.scaledToScreen, weight: .regular), accessibilityText: "revenueLabel")
    
    //MARK: - Setup Methods
    func setView() {
        addSubview(bannerImageView)
        addSubview(shadowView)
        addSubview(dataImageView)
        addSubview(titleLabel)
        addSubview(yearLabel)
        addSubview(persentageLabel)
        addSubview(overviewTitleLabel)
        addSubview(overviewLabel)
        addSubview(budgetTitleLabel)
        addSubview(budgetLabel)
        addSubview(revenueTitleLabel)
        addSubview(revenueLabel)
        
        setPersentageLabel()
        applyConstraints()
    }
    
    fileprivate func applyConstraints() {
        NSLayoutConstraint.activate([
            ///bannerImageView
            bannerImageView.topAnchor.constraint(equalTo: topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            
            ///shadowView
            shadowView.topAnchor.constraint(equalTo: bannerImageView.topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bannerImageView.bottomAnchor),
            shadowView.leadingAnchor.constraint(equalTo: bannerImageView.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: bannerImageView.trailingAnchor),
            
            ///dataImageView
            dataImageView.centerYAnchor.constraint(equalTo: shadowView.bottomAnchor),
            dataImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dataImageView.heightAnchor.constraint(equalToConstant: UIScreen.screenHeight / 3.5),
            dataImageView.widthAnchor.constraint(equalToConstant: UIScreen.screenWidth / 2.5),

            ///titleLabel
            titleLabel.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: 10.scaledToScreen),
            titleLabel.leadingAnchor.constraint(equalTo: dataImageView.trailingAnchor, constant: 10.scaledToScreen),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10.scaledToScreen),
            
            ///yearLabel
            yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.scaledToScreen),
            yearLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            yearLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            ///persentageLabel
            persentageLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 10.scaledToScreen),
            persentageLabel.leadingAnchor.constraint(equalTo: yearLabel.leadingAnchor),
            persentageLabel.heightAnchor.constraint(equalToConstant: 40.scaledToScreen),
            persentageLabel.widthAnchor.constraint(equalToConstant: 40.scaledToScreen),
            
            ///overviewTitleLabel
            overviewTitleLabel.topAnchor.constraint(equalTo: dataImageView.bottomAnchor, constant: 10.scaledToScreen),
            overviewTitleLabel.leadingAnchor.constraint(equalTo: dataImageView.leadingAnchor),
            
            ///overviewLabel
            overviewLabel.topAnchor.constraint(equalTo: overviewTitleLabel.topAnchor),
            overviewLabel.leadingAnchor.constraint(equalTo: overviewTitleLabel.trailingAnchor, constant: 10.scaledToScreen),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.scaledToScreen),
            
            ///budgetTitleLabel
            budgetTitleLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 10.scaledToScreen),
            budgetTitleLabel.leadingAnchor.constraint(equalTo: overviewTitleLabel.leadingAnchor),
            
            ///budgetLabel
            budgetLabel.topAnchor.constraint(equalTo: budgetTitleLabel.topAnchor),
            budgetLabel.leadingAnchor.constraint(equalTo: budgetTitleLabel.trailingAnchor, constant: 10.scaledToScreen),
            budgetLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.scaledToScreen),
            
            ///revenueTitleLabel
            revenueTitleLabel.topAnchor.constraint(equalTo: budgetTitleLabel.bottomAnchor, constant: 10.scaledToScreen),
            revenueTitleLabel.leadingAnchor.constraint(equalTo: budgetTitleLabel.leadingAnchor),
            
            ///budgetLabel
            revenueLabel.topAnchor.constraint(equalTo: revenueTitleLabel.topAnchor),
            revenueLabel.leadingAnchor.constraint(equalTo: revenueTitleLabel.trailingAnchor, constant: 10.scaledToScreen),
            revenueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.scaledToScreen),
        ])
    }
    
    //MARK: - Helper Methods
    func setPersentageLabel() {
        persentageLabel.backgroundColor = .label
        persentageLabel.clipsToBounds = true
        persentageLabel.layer.cornerRadius = 20.scaledToScreen
        persentageLabel.layer.borderWidth = 2.scaledToScreen
        persentageLabel.layer.borderColor = UIColor.gray.cgColor
    }
    
    func convertCurrency(_ data: Double) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "en_US")
        return currencyFormatter.string(from: data as NSNumber) ?? ""
    }
    
    func setData(_ movieData: MovieDetail?) {
        DispatchQueue.main.async {
            if let data = movieData {
                if let imageUrl = data.backdropPath {
                    ImageDownloadService.getImage(urlString: AppConfiguration.shared.bannerImageBaseURL + imageUrl) { [weak self] image in
                        self?.bannerImageView.image = image
                    }
                } else {
                    self.bannerImageView.image = UIImage(named: "Plceholder")
                }
                
                if let imageUrl = data.posterPath {
                    ImageDownloadService.getImage(urlString: AppConfiguration.shared.imageBaseURL + imageUrl) { [weak self] image in
                        self?.dataImageView.image = image
                    }
                } else {
                    self.dataImageView.image = UIImage(named: "Plceholder")
                }
                self.titleLabel.text = data.title
                self.yearLabel.text = data.releaseDate
                let persentage = Int(((data.voteAverage ?? 0.0) / 10.0) * 100)
                self.persentageLabel.text = "\(persentage)%"
                self.budgetLabel.text = "\(self.convertCurrency(data.budget ?? 0.0))"
                self.overviewLabel.text = data.overview
                self.revenueLabel.text = "\(self.convertCurrency(data.revenue ?? 0.0))"
            }
        }
    }
}
