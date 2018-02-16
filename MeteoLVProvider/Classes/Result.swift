//
//  ResultType.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 16/02/2018.
//

import Foundation

/// Result type
public enum Result<T> {

  /// Success
  case success(T)
  
  /// Failure
  case failure(Error)
}
