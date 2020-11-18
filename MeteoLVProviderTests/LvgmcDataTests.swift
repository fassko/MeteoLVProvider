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
        print(lvgmcData.count)
        XCTAssertFalse(lvgmcData.isEmpty)
      }
      .store(in: &cancellables)
    
    waitForExpectations(timeout: 5, handler: nil)
  }
  
}
