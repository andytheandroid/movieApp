//
//  DownloadManager.swift
//  movieApp
//
//  Created by Carlos Torres Sanchez on 6/27/19.
//  Copyright © 2019 Carlos Torres Sanchez. All rights reserved.
//

import Foundation
protocol DownloadManagerDelegate:class{
  
  func didDownloadImage(_:DownloadManager, data:Data)
}
class DownloadManager{
  
  var delegate:DownloadManagerDelegate?
  var imageCache = NSCache<NSString, NSData>()
  
  func startDownload(from url:URL){
    // First check if there is an image in the cache
    if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as Data? {
      
      delegate?.didDownloadImage(self, data: cachedImage)
      
    }
    else{
    URLSession(configuration: .default).dataTask(with: url) { data, response, error in
      guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
        let data = data, error == nil
        else { return }
      DispatchQueue.main.async() {
        self.imageCache.setObject(data as NSData, forKey: url.absoluteString as NSString)
        self.onDownloadCompleted(with: data)
      }
      }.resume()
    }
    
  }
  
  func onDownloadCompleted(with data:Data){
    delegate?.didDownloadImage(self, data: data)
  }
  
  
  
  
}
