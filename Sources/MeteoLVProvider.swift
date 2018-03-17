import Foundation

/// Meteo.lv observations provider
public struct MeteoLVProvider {
  
  public init() {}
  
  /**
    Get observations from Latvian Environment, Geology and Meteorology Centre
   
    - Parameters:
      - completion: Completion block with Result type
  */
  public func observations(completion: @escaping (Result<[Station]>) -> Void) {
    let url = URL(string: "http://www.meteo.lv/meteorologijas-operativie-dati/")!
    URLSession.shared.dataTask(with: url) { data, _, error in
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
  
  /**
   Get observations from Latvian State Roads
   
   - Parameters:
     - completion: Completion block with Result type
  */
  public func latvianRoadsObservations(completion: @escaping (Result<[LatvianRoadsStation]>) -> Void) {
    var urlComponents = URLComponents(string: "https://lvceli.lv/proxy/CMSPoint.ashx/0/query")
    
    urlComponents?.queryItems = [
      URLQueryItem(name: "where", value: "1=1"),
      URLQueryItem(name: "returnGeometry", value: "true"),
      URLQueryItem(name: "outFields", value: "NOSAUKUMS,CMS_STATUS,GISLVC.SDE_OWNER.CMS_XY.STATION,acid,nosaukums,km"),
      URLQueryItem(name: "outSR", value: "4326"),
      URLQueryItem(name: "returnIdsOnly", value: "false"),
      URLQueryItem(name: "callback", value: ""),
      URLQueryItem(name: "f", value: "json")
    ]
    
    guard let url = urlComponents?.url else {
      completion(Result.failure(MeteoLVError.latvianRoadsweatherData))
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, _, error in
      if let error = error {
        completion(Result.failure(error))
      } else if let data = data {
        do {
          let stations = try JSONDecoder().decode(LatvianRoadsStationsData.self, from: data)
          let filteredStations = stations.features.filter({ $0.attributes.weather ?? " N/A " != " N/A " })
          completion(Result.success(filteredStations))
        } catch {
          completion(Result.failure(error))
        }
      }
    }.resume()
  }
}
