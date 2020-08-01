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
  
  /// meteo.lv station
  case meteo(Station)
  
  /// lvceli.lv station
  case road(LatvianRoadsStation)
  
  /// Latitude
  public var latitude: Double {
    switch self {
    case .meteo(let meteoStation):
      return meteoStation.latitude
    case .road(let lvRoadStation):
      return lvRoadStation.latitude
    }
  }
  
  /// Longitude
  public var longitude: Double {
    switch self {
    case .meteo(let meteoStation):
      return meteoStation.longitude
    case .road(let lvRoadStation):
      return lvRoadStation.longitude
    }
  }
  
  /// Temperature
  public var temperature: String? {
    switch self {
    case .meteo(let meteoStation):
      return meteoStation.temperature
    case .road(let lvRoadStation):
      return lvRoadStation.temperature
    }
  }
  
  /// Wind
  public var wind: String? {
    switch self {
    case .meteo(let meteoStation):
      return meteoStation.wind
    case .road(let lvRoadStation):
      return lvRoadStation.wind
    }
  }
  
  var uniqueId: String {
    switch self {
    case .meteo(let meteoStation):
      return meteoStation.id
    case .road(let lvRoadStation):
      return lvRoadStation.uniqueId
    }
  }
  
  /// ID of the station
  public var id: String {
    switch self {
    case .meteo:
      return Data((name + uniqueId + "meteo").utf8).hexDescription
    case .road:
      return Data((name + uniqueId + "lvRoad").utf8).hexDescription
    }
  }
  
  /// Name of the station
  public var name: String {
    switch self {
    case let .meteo(meteoStation):
      return meteoStation.name
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
    case let .meteo(meteoStation):
      
      guard let meteoStationParams = meteoStation.parameters else {
        return []
      }
      
      return meteoStationParams.compactMap { parameter -> [String: String]? in
        guard let value = parameter.value else {
          return nil
        }
        
        return [
          "name": parameter.name,
          "value": value
        ]
      }.map { $0 }
      
    case let .road(roadStation):
      
      return roadStation.weatherData.map({ parameter -> [String: String] in
        return [
          "name": parameter.label,
          "value": parameter.value
        ]
      })
    }
  }
}

extension Data {
  var hexDescription: String {
    return reduce("") {$0 + String(format: "%02x", $1)}
  }
}

extension Array where Element == ObservationStation {
  var meteoLVStations: [Station] {
    compactMap { station -> Station? in
      switch station {
      case .meteo(let station):
        return station
      case .road:
        return nil
      }
    }
  }
  
  var lvRoadStations: [LatvianRoadsStation] {
    compactMap { station -> LatvianRoadsStation? in
      switch station {
      case .meteo:
        return nil
      case .road(let station):
        return station
      }
    }
  }
}
