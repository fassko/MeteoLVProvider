//
//  ObservationStation+Extensions.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 01/08/2020.
//  Copyright © 2020 fassko. All rights reserved.
//

import Foundation

extension Array where Element == ObservationStation {
  var lvgmcStations: [LvgmcData] {
    compactMap { station in
      switch station {
      case .lvgmc(let lvgmcData):
        return lvgmcData
      case .road:
        return nil
      }
    }
  }
  
  var lvRoadStations: [LatvianRoadsStation] {
    compactMap { station in
      switch station {
      case .lvgmc:
        return nil
      case .road(let station):
        return station
      }
    }
  }
}
