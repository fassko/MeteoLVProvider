//
//  MeteoLVProvider_ExampleTests.swift
//  MeteoLVProvider_ExampleTests
//
//  Created by Kristaps Grinbergs on 16/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

import Combine

@testable import MeteoLVProvider

class LVRoadTests: XCTestCase {
  
  var meteoLvProvider: MeteoLVProvider!
  var cancellables: Set<AnyCancellable>!
  
  override func setUp() {
    meteoLvProvider = MeteoLVProvider()
    cancellables = Set<AnyCancellable>()
  }
    
  func testLvRoadData() {
    let expectation = self.expectation(description: #function)
    
    meteoLvProvider.latvianRoadsObservations()
      .sink { completion in
        switch completion {
        case .finished:
          expectation.fulfill()
        case .failure(let error):
          XCTFail("Failed to get observation data \(error)")
        }
      } receiveValue: { lvRoadData in
        XCTAssertFalse(lvRoadData.isEmpty)
      }
      .store(in: &cancellables)

    waitForExpectations(timeout: 5, handler: nil)
  }
}
