//
//  LvgmcDataTests.swift
//  MeteoLVProviderTests
//
//  Created by Kristaps Grinbergs on 17/11/2020.
//  Copyright © 2020 fassko. All rights reserved.
//

import XCTest

import Combine

@testable import MeteoLVProvider

class LvgmcDataTests: XCTestCase {
  
  var lvgmcProvider: LvgmcProvider!
  var cancellables: Set<AnyCancellable>!
  
  override func setUp() {
    lvgmcProvider = LvgmcProvider()
    cancellables = Set<AnyCancellable>()
  }

  func testGetDataCombine() {
    let expectation = self.expectation(description: #function)
    
    lvgmcProvider.getWeatherDataCombine()
      .sink { completion in
        switch completion {
        case .finished:
          expectation.fulfill()
        case .failure(let error):
          XCTFail("Failed to get LvgmcData \(error)")
        }
      } receiveValue: { lvgmcData in
        XCTAssertFalse(lvgmcData.isEmpty)
      }
      .store(in: &cancellables)
    
    waitForExpectations(timeout: 5, handler: nil)
  }
  
  func testForecastData() {
    let expectation = self.expectation(description: #function)
    
    lvgmcProvider.getWeatherForecastNextHour()
      .sink { completion in
        switch completion {
        case .finished:
          expectation.fulfill()
        case .failure(let error):
          XCTFail("Failed to get weather forecast for next hour \(error)")
        }
      } receiveValue: { weatherForecastData in
        XCTAssertFalse(weatherForecastData.isEmpty)
      }
      .store(in: &cancellables)

    waitForExpectations(timeout: 5, handler: nil)
  }
  
}
