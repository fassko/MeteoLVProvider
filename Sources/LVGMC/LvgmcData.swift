//
//  LvgmcData.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 17/11/2020.
//  Copyright © 2020 fassko. All rights reserved.
//

import Foundation

public struct LvgmcData: Hashable {
  public let measuredDate: Date
  public let stationCode: String
  public let stationName: String
  public let temperature: Double
  public let windDirection: Double?
  public let windSpeed: Double
  public let relativeHumidity: Double
  public let atmosphericPressure: Double
  public let precipitation: Double
  public let visibility: Double
  public let snowCover: Double
  public let latitude: Double
  public let longitude: Double
}

struct LvgmcResponseData: Decodable {
  let measuredDate: Date
  let stationCode: String
  let stationName: String?
  let temperature: Double?
  let windDirection: Double?
  let windSpeed: Double?
  let relativeHumidity: Double?
  let atmosphericPressure: Double?
  let precipitation: Double?
  let visibility: Double?
  let snowCover: Double?
  let latitude: Double?
  let longitude: Double?
  
  enum CodingKeys: String, CodingKey {
    case measuredDate = "laiks"
    case stationCode = "stacijas_kods"
    case temperature = "temperatura"
    case windDirection = "veja_virziens"
    case windSpeed = "videja_veja_atrums"
    case relativeHumidity = "veja_brazmas"
    case atmosphericPressure = "relativais_mitrums"
    case precipitation = "nokrisnu_daudzums"
    case visibility = "redzamiba"
    case snowCover = "sniega_segas_biezums"
  }
  
  public init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    let measuredDateString = try container.decode(String.self, forKey: .measuredDate)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy.MM.dd HH:mm"
    measuredDate = dateFormatter.date(from: measuredDateString)!
    
    let stationCodeString = try container.decode(String.self, forKey: .stationCode)
    stationCode = stationCodeString
    stationName = lvgmcStations.first { $0.code == stationCodeString }?.name
    temperature = try container.decodeIfPresent(String.self, forKey: .temperature)?.doubleValue
    windDirection = try container.decodeIfPresent(String.self, forKey: .windDirection)?.doubleValue
    windSpeed = try container.decodeIfPresent(String.self, forKey: .windSpeed)?.doubleValue
    relativeHumidity = try container.decodeIfPresent(String.self, forKey: .relativeHumidity)?.doubleValue
    atmosphericPressure = try container.decodeIfPresent(String.self, forKey: .atmosphericPressure)?.doubleValue
    precipitation = try container.decodeIfPresent(String.self, forKey: .precipitation)?.doubleValue
    visibility = try container.decodeIfPresent(String.self, forKey: .visibility)?.doubleValue
    snowCover = try container.decodeIfPresent(String.self, forKey: .snowCover)?.doubleValue
    latitude = lvgmcStations.first { $0.code == stationCodeString }?.latitude
    longitude = lvgmcStations.first { $0.code == stationCodeString }?.longitude
  }
}

extension LvgmcData {
  public var parameters: [String: String] {
    [
      "Temperatūra (°C)": temperature.description,
      "Vēja virziens": windDirection?.description ?? "",
      "Vēja ātrums (m/s)": windSpeed.description,
      "Mitrums (%)": relativeHumidity.description,
      "Spiediens (mm Hg)": atmosphericPressure.description,
      "Nokrišņi (mm)": precipitation.description,
      "Redzamība (m)": visibility.description,
      "Sniega sega": snowCover.description
    ]
  }
}

extension String {
  var doubleValue: Double? {
    Double(self)
  }
  
  var doubleValueUnwrapped: Double {
    Double(self) ?? 0
  }
}
