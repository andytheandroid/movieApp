//
//  Movie.swift
//  movieApp
//
//  Created by Carlos Torres Sanchez on 6/26/19.
//  Copyright © 2019 Carlos Torres Sanchez. All rights reserved.
//

import Foundation

struct Movies:Codable{
  
  var results:[MovieResult]
  
  
}

struct MovieResult:Codable{
  var vote_count:Int
  var id:Int
  var video:Bool
  var vote_average:Double
  var title:String
  var popularity:Double
  var poster_path:String
  var original_language:String
  var original_title:String
  var genre_ids:[Int]
  var backdrop_path:String
  var adult:Bool
  var overview:String
  var release_date:String
  
}
