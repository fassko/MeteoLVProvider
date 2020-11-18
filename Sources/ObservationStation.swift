//
//  ObservationStation.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 18/04/2020.
//  Copyright © 2020 fassko. All rights reserved.
//

import Foundation

/// Observation station
public enum ObservationStation: Comparable, CustomStringConvertible, Equatable, Hashable, Identifiable {
  
  /// lvgmc station
  case lvgmc(LvgmcData)
  
  /// lvceli.lv station
  case road(LatvianRoadsStation)
  
  /// Latitude
  public var latitude: Double {
    switch self {
    case .lvgmc(let lvgmcData):
      return lvgmcData.latitude
    case .road(let lvRoadStation):
      return lvRoadStation.latitude
    }
  }
  
  /// Longitude
  public var longitude: Double {
    switch self {
    case .lvgmc(let lvgmcData):
      return lvgmcData.longitude
    case .road(let lvRoadStation):
      return lvRoadStation.longitude
    }
  }
  
  /// Temperature
  public var temperature: String? {
    switch self {
    case .lvgmc(let lvgmcData):
      return lvgmcData.temperature.description
    case .road(let lvRoadStation):
      return lvRoadStation.temperature
    }
  }
  
  /// Wind
  public var wind: String? {
    switch self {
    case .lvgmc(let lvgmcData):
      return lvgmcData.windSpeed.description
    case .road(let lvRoadStation):
      return lvRoadStation.wind
    }
  }
  
  var uniqueId: String {
    switch self {
    case .lvgmc(let lvgmcData):
      return lvgmcData.stationCode
    case .road(let lvRoadStation):
      return lvRoadStation.uniqueId
    }
  }
  
  /// ID of the station
  public var id: String {
    switch self {
    case .lvgmc:
      return Data((name + uniqueId + "meteo").utf8).hexDescription
    case .road:
      return Data((name + uniqueId + "lvRoad").utf8).hexDescription
    }
  }
  
  /// Name of the station
  public var name: String {
    switch self {
    case let .lvgmc(lvgmcData):
      return lvgmcData.stationName
    case let .road(roadStation):
      return roadStation.name
    }
  }
  
  public var description: String {
    name
  }
  
  public static func < (lhs: ObservationStation, rhs: ObservationStation) -> Bool {
    compare(lhs, rhs)
  }
  
  public static func == (lhs: ObservationStation, rhs: ObservationStation) -> Bool {
    compare(lhs, rhs)
  }
  
  public static func compare(_ lhs: ObservationStation, _ rhs: ObservationStation) -> Bool {
    let range = lhs.name.startIndex..<lhs.name.endIndex
    let comparisonResult = lhs.name.compare(rhs.name,
                                            options: .caseInsensitive,
                                            range: range,
                                            locale: Locale(identifier: "lv_LV"))
    
    switch comparisonResult {
    case .orderedAscending:
      return true
    case .orderedSame:
      return true
    case .orderedDescending:
      return false
    }
  }
  
  /// Weather parameters
  public var parameters: [[String: String]] {
    switch self {
    case let .lvgmc(lvgmcData):
      return lvgmcData.parameters
      
    case let .road(roadStation):
      return roadStation.weatherData.map { parameter in
        [
          "name": parameter.label,
          "value": parameter.value
        ]
      }
    }
  }
}
