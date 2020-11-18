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

class MeteoLVProviderTests: XCTestCase {
  
  var meteoLvProvider: MeteoLVProvider!
  var cancellables: Set<AnyCancellable>!
  
  override func setUp() {
    meteoLvProvider = MeteoLVProvider()
    cancellables = Set<AnyCancellable>()
  }
    
  func testObservations() {
    let expectation = self.expectation(description: #function)
    
    meteoLvProvider.observations()
      .sink { completion in
        switch completion {
        case .finished:
          expectation.fulfill()
        case .failure(let error):
          XCTFail("Failed to get observation data \(error)")
        }
      } receiveValue: { observationData in
        XCTAssertFalse(observationData.isEmpty)
      }
      .store(in: &cancellables)

    waitForExpectations(timeout: 5, handler: nil)
  }
}
