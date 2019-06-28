//
//  movieAppTests.swift
//  movieAppTests
//
//  Created by Carlos Torres Sanchez on 6/26/19.
//  Copyright © 2019 Carlos Torres Sanchez. All rights reserved.
//

import XCTest
@testable import movieApp

class movieAppTests: XCTestCase {

    override func setUp() {
      testJSONMappingToMovieObject()
      testJSONMappingForPopularMovies()
      
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  func testJSONMappingToMovieObject(){
    let jsonManager = JSONManagerMock()
    let movie = jsonManager.mapJSONFileToObject(with: "movie")

    
    
  }
  
  func testJSONMappingForPopularMovies(){
    let jsonManager = JSONManagerMock()
    let movie = jsonManager.mapJSONFileToObject(with: "popular")
    
    
  }
}
