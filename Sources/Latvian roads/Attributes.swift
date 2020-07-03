//
//  Attributes.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 17/03/2018.
//  Copyright © 2018 fassko. All rights reserved.
//

import Foundation

struct Attributes: Codable, Hashable {
  
  /// Id of station
  let id: String
  
  /// Name of station
  let name: String
  
  /// Road name of station
  let road: String
  
  /// Km on the road
  let km: Double
  
  /// Weather html data
  let weather: String?
  
  enum CodingKeys: String, CodingKey {
    case name = "LVC_CMS.dbo.view_cms_statuss.nosaukums"
    case id = "GIS.DBO.LVC_CMS.STATION"
    case road = "LVC_CMS.dbo.view_cms_statuss.acid"
    case km = "LVC_CMS.dbo.view_cms_statuss.km"
    case weather = "LVC_CMS.dbo.view_cms_statuss.CMS_STATUS"
  }
}
