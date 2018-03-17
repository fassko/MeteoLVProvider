//
//  MeteoLVProvider_ExampleTests.swift
//  MeteoLVProvider_ExampleTests
//
//  Created by Kristaps Grinbergs on 16/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import MeteoLVProvider

class MeteoLVProvider_ExampleTests: XCTestCase {
    
    func testExample() {
  
    let expectation = self.expectation(description: "observations")
    var observations: [Station]?
  
    MeteoLVProvider.observations { result in
      switch result {
      case let .success(stations):
        print(stations)
        observations = stations
        expectation.fulfill()
      case let .failure(error):
        print(error)
        XCTFail("Failed to get observations")
      }
    }
    
    waitForExpectations(timeout: 5, handler: nil)
    
    XCTAssertNotNil(observations, "Should get observation data")
  }
    
}
