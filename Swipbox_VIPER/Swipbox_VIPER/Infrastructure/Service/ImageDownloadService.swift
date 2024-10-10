//
//  ImageDownloadService.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 07/10/2024.
//

import UIKit

final class ImageDownloadService {
    private static var imageCache = NSCache<AnyObject, AnyObject>()
    private static let cacheQueue = DispatchQueue(label: "com.imageDownloadService.cacheQueue", attributes: .concurrent)
    
    class func getImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        cacheQueue.sync {
            if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
                DispatchQueue.main.async {
                    completion(cachedImage)
                }
                return
            }
        }
        
        // Download the image if not cached
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle errors
            if let error = error {
                print("Image download failed: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            // Check the response status
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("Invalid response code: \(httpResponse.statusCode)")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            // Ensure data is not nil and valid image data
            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid image data")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            // Cache the image
            cacheQueue.async(flags: .barrier) {
                imageCache.setObject(image, forKey: urlString as AnyObject)
            }
            
            // Return the image on the main thread
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }
}
