import Foundation
import Combine
import PlaygroundSupport

import MeteoLVProvider

PlaygroundPage.current.needsIndefiniteExecution = true

var lvgmcProvider = LvgmcProvider()
let cancellable = lvgmcProvider.getWeatherDataCombine()
  .replaceError(with: [])
  .map { $0.filter { lvgmcData in lvgmcData.stationName == "Rīga" } }
  .sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
//      PlaygroundPage.current.finishExecution()
      break
    }
  }) { lvgmcData in
    print(lvgmcData)
  }


let cancellable2 = lvgmcProvider.getWeatherForecastNextHour()
  .replaceError(with: [])
  .sink { completion in
    switch completion {
    case .finished:
//      PlaygroundPage.current.finishExecution()
      break
    }
  } receiveValue: { forecastData in
    print(forecastData)
  }


