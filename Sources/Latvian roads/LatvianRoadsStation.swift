//
//  LatvianRoadsStation.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 17/03/2018.
//  Copyright © 2018 fassko. All rights reserved.
//

import Foundation
import SwiftSoup

/// Latvian roads weather station
public struct LatvianRoadsStation: Codable {
  
  /// Name of station
  public var name: String {
    return attributes.name
  }
  
  /// Road name where station is located
  public var road: String {
    return attributes.road
  }
  
  /// Km on the road
  public var km: Double {
    return attributes.km
  }
  
  /// Latitude
  public var latitude: Double {
    return geometry.latitude
  }
  
  /// Longitude
  public var longitude: Double {
    return geometry.longitude
  }
  
  /// Current temperature
  public var temperature: String? {
    return weatherData.first?.value
  }
  
  /// Wind
  public var wind: String? {
    guard let wind = weatherData.first(where: { $0.label == "Vējš" }) else {
      return nil
    }
    
    return wind.value
  }
  
  /// Current weather data
  public var weatherData: [RoadStationWeatherData] {
    do {
      guard let parts = attributes.weather?.components(separatedBy: "<br/>") else {
        return []
      }
      
      let weatherData = try parts.compactMap({ part -> RoadStationWeatherData? in
        let doc: Document = try SwiftSoup.parse(part)
        let seperatedKeyValue = try doc.text().components(separatedBy: ":")
        
        guard seperatedKeyValue.count == 2,
          let label = seperatedKeyValue.first, let value = seperatedKeyValue.last else {
          return nil
        }
        
        return RoadStationWeatherData(
          label: label,
          value: value.trimmingCharacters(in: .whitespaces)
        )
      }).map({ $0 })
      
      return weatherData
    } catch {
      print("Can't parse weather data")
      return []
    }
  }
  
  /// Attributes
  let attributes: Attributes
  
  /// Geometry (coordinates)
  let geometry: Geometry
}
