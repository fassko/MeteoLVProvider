//
//  Geometry.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 17/03/2018.
//  Copyright © 2018 fassko. All rights reserved.
//

import Foundation

// Geometry (coordinates) of station
struct Geometry: Codable, Hashable {
 
  /// Latitude
  public let latitude: Double
  
  /// Longitude
  public let longitude: Double
  
  enum CodingKeys: String, CodingKey {
    case longitude = "x"
    case latitude = "y"
  }
}
