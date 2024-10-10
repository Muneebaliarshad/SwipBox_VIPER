//
//  AppConfiguration.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 07/10/2024.
//

import Foundation

final class AppConfiguration {
    
    static let shared = AppConfiguration()
    
    private init() {}
    
    private func fetchValue(forKey key: String, description: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) as? String, !value.isEmpty else {
            fatalError("\(description) must not be empty in plist. Key: \(key)")
        }
        return value
    }
    
    lazy var apiBaseURL: String = fetchValue(forKey: "ApiBaseURL", description: "API Base URL")
    lazy var imageBaseURL: String = fetchValue(forKey: "ImageBaseURL", description: "Image Base URL")
    lazy var bannerImageBaseURL: String = fetchValue(forKey: "BannerImageBaseURL", description: "Banner Image Base URL")
    lazy var apiAccessToken: String = fetchValue(forKey: "ApiAccessToken", description: "API Access Token")
}
