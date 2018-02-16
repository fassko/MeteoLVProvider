import Foundation

/// Meteo.lv observations provider
public struct MeteoLVProvider {
  
  /**
    Get observtions
   
    - Parameters:
      - completion: Completion block with Result type
  */
  public static func observations(completion: @escaping (Result<[Station]>) -> Void) {
    let url = URL(string: "http://www.meteo.lv/meteorologijas-operativie-dati/")!
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        completion(Result.failure(error))
      } else if let data = data {
        do {
          let observationData = try JSONDecoder().decode(ObservationData.self, from: data)
          completion(Result.success(observationData.stations))
        } catch {
          completion(Result.failure(error))
        }
      }
    }.resume()
  }
}
