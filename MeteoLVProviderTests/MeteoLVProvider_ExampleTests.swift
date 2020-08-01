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
    
  func testObservations() {
    let expectation = self.expectation(description: #function)
    
    MeteoLVProvider().observations { result in
      switch result {
      case let .success(observationStations):
        observationStations.forEach { station in
          switch station {
          case .meteo(let meteoLVStation):
            XCTAssertNotNil(meteoLVStation.id)
            XCTAssertNotNil(meteoLVStation.latitude)
            XCTAssertNotNil(meteoLVStation.longitude)
            XCTAssertNotNil(meteoLVStation.name)
            XCTAssertNotNil(meteoLVStation.temperature)
            XCTAssertNotNil(meteoLVStation.wind)
          case .road(let lvRoadStation):
            XCTAssertNotNil(lvRoadStation.latitude)
            XCTAssertNotNil(lvRoadStation.latitude)
            XCTAssertNotNil(lvRoadStation.longitude)
            XCTAssertNotNil(lvRoadStation.name)
            XCTAssertNotNil(lvRoadStation.temperature)
          }
        }
        
        expectation.fulfill()
      case let .failure(error):
        XCTFail("Failed to get observations \(error)")
      }
    }
    
    waitForExpectations(timeout: 5, handler: nil)
  }
  
  func testMeteoLV() {
    let expectation = self.expectation(description: #function)
    var observations: [Station]?
    
    MeteoLVProvider().observations { result in
      switch result {
      case .success(let stations):
        observations = stations.meteoLVStations
        expectation.fulfill()
      case .failure(let error):
        XCTFail("Failed to get observations \(error)")
      }
    }
    
    waitForExpectations(timeout: 5, handler: nil)
    
    XCTAssertNotNil(observations, "Should get observation data")
  }
  
  func testLatvianRoads() {
    let expectation = self.expectation(description: #function)
    var observations: [LatvianRoadsStation]?

    MeteoLVProvider().observations { result in
      switch result {
      case .success(let stations):
        observations = stations.lvRoadStations
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
