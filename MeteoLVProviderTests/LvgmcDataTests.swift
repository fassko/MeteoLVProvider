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
  
  override func setUp() {
    lvgmcProvider = LvgmcProvider()
  }
  
  func testGetData() {
    let expectation = self.expectation(description: #function)
    
    lvgmcProvider.getWeatherData { result in
      switch result {
      
      case .success(let lvgmcData):
        XCTAssertFalse(lvgmcData.isEmpty)
      case .failure(let error):
        XCTFail("Failed to get LvgmcData \(error)")
      }
      expectation.fulfill()
    }
    
    waitForExpectations(timeout: 5, handler: nil)
  }
  
  func testGetDataCombine() {
    let expectation = self.expectation(description: #function)
    
    var cancellables = Set<AnyCancellable>()
    
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
  
}
