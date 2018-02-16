//
//  ResultType.swift
//  MeteoLVProvider
//
//  Created by Kristaps Grinbergs on 16/02/2018.
//

import Foundation

public enum Result<T> {
  case success(T)
  case failure(Error)
}
