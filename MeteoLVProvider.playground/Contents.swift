import Foundation
import MeteoLVProvider
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

MeteoLVProvider.latvianRoadsObservations { result in
  print(result)
}
