//
//  ObservationStation+Extensions.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 01/08/2020.
//  Copyright © 2020 fassko. All rights reserved.
//

import Foundation

extension Array where Element == ObservationStation {
  var meteoLVStations: [Station] {
    compactMap { station in
      switch station {
      case .meteo(let station):
        return station
      case .road:
        return nil
      }
    }
  }
  
  var lvRoadStations: [LatvianRoadsStation] {
    compactMap { station in
      switch station {
      case .meteo:
        return nil
      case .road(let station):
        return station
      }
    }
  }
}
