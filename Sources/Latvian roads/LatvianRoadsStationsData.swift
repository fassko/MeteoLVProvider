//
//  LatvianRoadsStationsData.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 17/03/2018.
//  Copyright © 2018 fassko. All rights reserved.
//

import Foundation

/// Latvian roads data container
public struct LatvianRoadsStationsData: Codable {
  
  /// Features or stations
  let features: [LatvianRoadsStation]
}
