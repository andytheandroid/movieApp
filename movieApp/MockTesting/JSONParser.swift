//
//  JSONParser.swift
//  movieApp
//
//  Created by Carlos Torres Sanchez on 6/26/19.
//  Copyright © 2019 Carlos Torres Sanchez. All rights reserved.
//

import Foundation

class JSONParser<RESULT: Codable>{
  
  func parseJSONToObject(with data:Data) -> RESULT? {
    
    var result:RESULT?
    do{
      result = try JSONDecoder().decode(RESULT.self, from: data)
    }catch {
    }
    print(result)
    return result
    
  }
  
  func encodeToJSON <T:Codable> (with object: T)->Data{
    var data:Data = Data()
    do{
      let encoder = JSONEncoder()
      data =  try encoder.encode(object)
    }catch{
    }
    
    return data
    
  }
  
  
  
  
}
