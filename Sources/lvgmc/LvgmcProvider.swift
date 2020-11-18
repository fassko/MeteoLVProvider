//
//  LvgmcProvider.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 17/11/2020.
//  Copyright © 2020 fassko. All rights reserved.
//

import Foundation
import Combine

public struct LvgmcProvider {
  public init() {}
  
  private func convertToNonOptionalLvgmcData(_ lvgmcResponseData: [LvgmcResponseData]) -> [LvgmcData] {
    lvgmcResponseData.compactMap { lvgmcResponseData in
      guard let temperature = lvgmcResponseData.temperature,
            let stationName = lvgmcResponseData.stationName,
            let windSpeed = lvgmcResponseData.windSpeed,
            let relativeHumidity = lvgmcResponseData.relativeHumidity,
            let atmosphericPressure = lvgmcResponseData.atmosphericPressure,
            let precipitation = lvgmcResponseData.precipitation,
            let visibility = lvgmcResponseData.visibility,
            let snowCover = lvgmcResponseData.snowCover,
            let latitude = lvgmcResponseData.latitude,
            let longitude = lvgmcResponseData.longitude
      else {
        return nil
      }
      
      return LvgmcData(measuredDate: lvgmcResponseData.measuredDate,
                       stationCode: lvgmcResponseData.stationCode,
                       stationName: stationName,
                       temperature: temperature,
                       windDirection: lvgmcResponseData.windDirection,
                       windSpeed: windSpeed,
                       relativeHumidity: relativeHumidity,
                       atmosphericPressure: atmosphericPressure,
                       precipitation: precipitation,
                       visibility: visibility,
                       snowCover: snowCover,
                       latitude: latitude,
                       longitude: longitude)
    }
  }
  
  private func filterLastObservationData(_ lvgmcData: [String: [LvgmcData]]) -> [LvgmcData] {
    lvgmcData.compactMap { _, lvgmcData -> LvgmcData? in
      guard let lastData = lvgmcData.sorted(by: { lhs, rhs -> Bool in
        lhs.measuredDate > rhs.measuredDate
      }).first else {
        return nil
      }
      
      return lastData
    }
  }
  
  public func getWeatherDataCombine() -> AnyPublisher<[LvgmcData], Error> {
    let lvgmcURL = URL(string: "https://videscentrs.lvgmc.lv/data/weather_monitoring_data_raw")!
    
    return URLSession.shared
      .dataTaskPublisher(for: lvgmcURL)
      .map { $0.data }
      .decode(type: [LvgmcResponseData].self, decoder: JSONDecoder())
      .mapError { $0 as Error }
      .map { convertToNonOptionalLvgmcData($0) }
      .map { Dictionary(grouping: $0) { $0.stationCode } }
      .map { filterLastObservationData($0) }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
  
  public func getWeatherForecastNextHour() -> AnyPublisher<[LvgmcWeatherForecast], Error> {
    
    let queryItems = [URLQueryItem(name: "laiks", value: Date().nextHourDateString)]
    var urlComponents = URLComponents(string: "https://videscentrs.lvgmc.lv/data/weather_points_forecast")!
    urlComponents.queryItems = queryItems
    
    return URLSession.shared
      .dataTaskPublisher(for: urlComponents.url!)
      .map { $0.data }
      .decode(type: [LvgmcWeatherForecast].self, decoder: JSONDecoder())
      .mapError { $0 as Error }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
      
  }
}

extension Date {
  public var nextHourDateString: String {
    var calendar = Calendar.current
    calendar.timeZone = TimeZone(identifier: "GMT+2")!
    let minutes = calendar.component(.minute, from: self)
    let components = DateComponents(hour: 1, minute: -minutes)
    let nextHourDate = calendar.date(byAdding: components, to: self) ?? self
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyMMddHHmm"
    
    return dateFormatter.string(from: nextHourDate)
  }
}
