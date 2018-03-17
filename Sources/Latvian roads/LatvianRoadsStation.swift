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
  public var km: Int {
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
    return weatherComponent(.temperature)
  }
  
  /// Current wind
  public var wind: String? {
    return weatherComponent(.wind)
  }
  
  /// Current humidy
  public var humidity: String? {
    return weatherComponent(.humidity)
  }
  
  /// Attributes
  let attributes: Attributes
  
  /// Geometry (coordinates)
  let geometry: Geometry
  
  private func weatherComponent(_ component: WeatherComponent) -> String? {
    do {
      guard let html = attributes.weather, html != " N/A " else {
        return nil
      }
      
      let doc: Document = try SwiftSoup.parse(html)
      
      let elements = try doc.select("font").array()
      
      switch component {
      case .temperature:
       return try elements[0].text()
      case .wind:
        return try elements[3].text()
      case .humidity:
        return try elements[3].text()
      }
    } catch {
      print("Can't parse weather data")
      return nil
    }
  }
}

/// Weaher component
enum WeatherComponent {
  case temperature
  case wind
  case humidity
}
