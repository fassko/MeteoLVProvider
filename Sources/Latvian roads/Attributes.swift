//
//  Attributes.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 17/03/2018.
//  Copyright © 2018 fassko. All rights reserved.
//

import Foundation

struct Attributes: Codable {
  
  /// Id of station
  let id: String
  
  /// Name of station
  let name: String
  
  /// Road name of station
  let road: String
  
  /// Km on the road
  let km: Int
  
  /// Weather html data
  let weather: String?
  
  enum CodingKeys: String, CodingKey {
    case name = "nosaukums"
    case id = "GISLVC.SDE_OWNER.CMS_XY.STATION"
    case road = "acid"
    case km
    case weather = "CMS_STATUS"
  }
}
