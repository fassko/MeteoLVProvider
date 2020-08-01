//
//  Data+Extensions.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 01/08/2020.
//  Copyright © 2020 fassko. All rights reserved.
//

import Foundation

extension Data {
  var hexDescription: String {
    reduce("") {$0 + String(format: "%02x", $1)}
  }
}
