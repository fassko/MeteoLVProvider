import Foundation
import MeteoLVProvider
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let meteoLVProvider = MeteoLVProvider()

meteoLVProvider.latvianRoadsObservations {
  print($0)
}

meteoLVProvider.observations {
  print($0)
}
