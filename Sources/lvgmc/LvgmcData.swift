//
//  LvgmcData.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 17/11/2020.
//  Copyright © 2020 fassko. All rights reserved.
//

import Foundation

public struct LvgmcData: Decodable {
  let measuredDate: Date
  let stationCode: String
  let temperature: Double?
  let windDirection: Double?
  let windSpeed: Double?
  let relativeHumidity: Double?
  let atmosphericPressure: Double?
  let precipitation: Double?
  let visibility: Double?
  let snowCover: Double?
  
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
    
    stationCode = try container.decode(String.self, forKey: .stationCode)
    temperature = try container.decodeIfPresent(String.self, forKey: .temperature)?.doubleValue
    windDirection = try container.decodeIfPresent(String.self, forKey: .windDirection)?.doubleValue
    windSpeed = try container.decodeIfPresent(String.self, forKey: .windSpeed)?.doubleValue
    relativeHumidity = try container.decodeIfPresent(String.self, forKey: .relativeHumidity)?.doubleValue
    atmosphericPressure = try container.decodeIfPresent(String.self, forKey: .atmosphericPressure)?.doubleValue
    precipitation = try container.decodeIfPresent(String.self, forKey: .precipitation)?.doubleValue
    visibility = try container.decodeIfPresent(String.self, forKey: .visibility)?.doubleValue
    snowCover = try container.decodeIfPresent(String.self, forKey: .snowCover)?.doubleValue
  }
}

extension String {
  var doubleValue: Double? {
    Double(self)
  }
}
