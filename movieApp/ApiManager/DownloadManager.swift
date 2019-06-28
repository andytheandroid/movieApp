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
  func startDownload(from url:URL){
    URLSession(configuration: .default).dataTask(with: url) { data, response, error in
      guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
        let data = data, error == nil
        else { return }
      DispatchQueue.main.async() {
        self.onDownloadCompleted(with: data)
      }
      }.resume()
    
  }
  
  func onDownloadCompleted(with data:Data){
    delegate?.didDownloadImage(self, data: data)
  }
  
  
  
  
}
