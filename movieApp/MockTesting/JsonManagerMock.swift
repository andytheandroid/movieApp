//
//  JsonManagerMock.swift
//  movieApp
//
//  Created by Carlos Torres Sanchez on 6/26/19.
//  Copyright © 2019 Carlos Torres Sanchez. All rights reserved.
//

import Foundation
class JSONManagerMock{
  
  func mapJSONFileToObject(with filename:String)->Movies?{
    let path = Bundle.main.path(forResource: filename, ofType: "json")
    let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path!))
    let parser = JSONParser<Movies>()
    if let movies =  parser.parseJSONToObject(with: jsonData){
      return movies
    }else{
    return nil
    }
    
  }
  
  
  
}
