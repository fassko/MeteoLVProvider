//
//  LvgmcWeatherForecast.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 18/11/2020.
//  Copyright © 2020 fassko. All rights reserved.
//

import Foundation

public struct LvgmcWeatherForecast: Decodable {
  let name: String
  let longitude: Double
  let latitude: Double
  let temperature: Double
  let windSpeed: Double
  let windDirection: Double
  let windGusts: Double
  let precipitation1h: Double
  let relativeHumidity: Double
  let atmosphericPressure: Double
  let feelsLikeTemperature: Double
  
  enum CodingKeys: String, CodingKey {
    case name = "nosaukums"
    case longitude = "lon"
    case latitude = "lat"
    case temperature = "temperatura"
    case windSpeed = "veja_atrums"
    case windDirection = "veja_virziens"
    case windGusts = "brazmas"
    case precipitation1h = "nokrisni_1h"
    case relativeHumidity = "relativais_mitrums"
    case atmosphericPressure = "spiediens"
    case feelsLikeTemperature = "sajutu_temperatura"
  }
  
  public init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    name = try container.decode(String.self, forKey: .name)
    longitude = try container.decode(String.self, forKey: .longitude).doubleValueUnwrapped
    latitude = try container.decode(String.self, forKey: .latitude).doubleValueUnwrapped
    temperature = try container.decode(String.self, forKey: .temperature).doubleValueUnwrapped
    windSpeed = try container.decode(String.self, forKey: .windSpeed).doubleValueUnwrapped
    windDirection = try container.decode(String.self, forKey: .windDirection).doubleValueUnwrapped
    windGusts = try container.decode(String.self, forKey: .windGusts).doubleValueUnwrapped
    precipitation1h = try container.decode(String.self, forKey: .precipitation1h).doubleValueUnwrapped
    relativeHumidity = try container.decode(String.self, forKey: .relativeHumidity).doubleValueUnwrapped
    atmosphericPressure = try container.decode(String.self, forKey: .atmosphericPressure).doubleValueUnwrapped
    feelsLikeTemperature = try container.decode(String.self, forKey: .feelsLikeTemperature).doubleValueUnwrapped
  }
}
