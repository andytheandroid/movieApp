//
//  ApiManager.swift
//  movieApp
//
//  Created by Carlos Torres Sanchez on 6/27/19.
//  Copyright © 2019 Carlos Torres Sanchez. All rights reserved.
//

import Foundation

protocol APIManagerDelegate:class{
  
  func onError(delegate:ApiManager)
  func onSucess(delegate:ApiManager,data:Data)
  
}
class ApiManager{
  
  weak var delegate:APIManagerDelegate?
  func getDataFromService(with url:URL, jsonInputString:String? ,contentType:String = "", contentTypeHeader:String = "", method:String = "POST"){
    
    var httpRequest = URLRequest(url: url)
    if method == "POST"{
      if let inputBodyObject = jsonInputString{
       httpRequest.httpBody = inputBodyObject.data(using: .utf8)
      }
    }
    httpRequest.httpMethod = method
    
    
    
    let httpTask = URLSession(configuration: .default).dataTask(with: httpRequest){
      (data,response,error) in
      guard let _ = data, error == nil else {
        DispatchQueue.main.async(execute: {
        })
        print(error)
        self.delegate?.onError(delegate: self)
        return
      }
      
      
      
      DispatchQueue.main.async(execute: {
        print(response)
        if let dataToParse = data{
          self.delegate?.onSucess(delegate: self, data: dataToParse)

        }
        else{
          return
        }

        
      })
      
    }
    
    DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async(execute: {
      httpTask.resume()
    })
    
    
  }
}



