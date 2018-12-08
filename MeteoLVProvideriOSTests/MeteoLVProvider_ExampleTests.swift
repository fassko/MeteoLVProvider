//
//  MeteoLVProvider_ExampleTests.swift
//  MeteoLVProvider_ExampleTests
//
//  Created by Kristaps Grinbergs on 16/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

@testable import MeteoLVProvider

class MeteoLVProvider_ExampleTests: XCTestCase {
    
  func testExample() {
    
    let expectation = self.expectation(description: "observations")
    var observations: [Station]?
    
    MeteoLVProvider().observations { result in
      switch result {
      case let .success(stations):
        observations = stations
        expectation.fulfill()
      case let .failure(error):
        XCTFail("Failed to get observations \(error)")
      }
    }
    
    waitForExpectations(timeout: 5, handler: nil)
    
    XCTAssertNotNil(observations, "Should get observation data")
  }
  
  func testLatvianRoads() {

    let expectation = self.expectation(description: "latvianRoads")
    var observations: [LatvianRoadsStation]?

    MeteoLVProvider().latvianRoadsObservations { result in
      switch result {
      case let .success(stations):
        observations = stations
        expectation.fulfill()
      case let .failure(error):
        XCTFail("Failed to get observations \(error)")
      }
    }

    waitForExpectations(timeout: 5, handler: nil)

    XCTAssertNotNil(observations, "Should get observation data")

    guard let station = observations?.first else {
      XCTFail("Failed to get station")
      return
    }

    XCTAssertNotNil(station.name)
    XCTAssertNotNil(station.road)
    XCTAssertNotNil(station.km)
    XCTAssertNotNil(station.temperature)
    XCTAssertNotNil(station.latitude)
    XCTAssertNotNil(station.longitude)

    XCTAssertNil(observations?.first(where: { $0.temperature == nil }))
  }
  
}
