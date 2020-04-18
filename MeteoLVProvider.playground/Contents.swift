import Foundation
import MeteoLVProvider
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let meteoLVProvider = MeteoLVProvider()

meteoLVProvider.observations {
  print($0)
}
