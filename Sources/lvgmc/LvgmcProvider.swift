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
  private var cancellables = Set<AnyCancellable>()
  
  mutating func getWeatherData(completion: @escaping (Result<[LvgmcData], Error>) -> Void) {
    let lvgmcURL = URL(string: "https://videscentrs.lvgmc.lv/data/weather_monitoring_data_raw")!
    
    URLSession.shared
      .dataTaskPublisher(for: lvgmcURL)
      .map(\.data)
      .decode(type: [LvgmcData].self, decoder: JSONDecoder())
      .mapError { $0 as Error }
      .eraseToAnyPublisher()
      .receive(on: DispatchQueue.main)
      .sink { dataCompletion in
        switch dataCompletion {
        case .finished:
          break
        case .failure(let error):
          completion(.failure(error))
        }
      } receiveValue: { lvgmcData in
        completion(.success(lvgmcData))
      }
      .store(in: &cancellables)
  }
  
  func getWeatherDataCombine() -> AnyPublisher<[LvgmcData], Error> {
    let lvgmcURL = URL(string: "https://videscentrs.lvgmc.lv/data/weather_monitoring_data_raw")!
    
    return URLSession.shared
      .dataTaskPublisher(for: lvgmcURL)
      .map { $0.data }
      .decode(type: [LvgmcData].self, decoder: JSONDecoder())
      .mapError { $0 as Error }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}
