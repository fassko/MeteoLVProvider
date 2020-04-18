import Foundation

public protocol MeteoLVProviderProtocol {
  /// Get observations from Latvian Environment, Geology and Meteorology Centre and Latvian State Roads
  ///
  /// - Parameter completion: Completion block with Result type
  func observations(completion: @escaping (Result<[ObservationStation]>) -> Void)
}

/// Meteo.lv observations provider
public struct MeteoLVProvider: MeteoLVProviderProtocol {
  
  public init() {}
  
  public func observations(completion: @escaping (Result<[ObservationStation]>) -> Void) {
    meteoLVObservations { result in
      switch result {
      case .success(let meteoLVData):
        var tmpStationsData = meteoLVData.map { ObservationStation.meteo($0) }
        
        self.latvianRoadsObservations { result in
          switch result {
          case .success(let lvRoadsData):
            let lvRoadStations = lvRoadsData.map { ObservationStation.road($0) }
            tmpStationsData.append(contentsOf: lvRoadStations)

            DispatchQueue.main.async {
              completion(.success(tmpStationsData))
            }
          case .failure(let error):
            DispatchQueue.main.async {
              completion(.failure(error))
            }
          }
        }
      case .failure(let error):
        DispatchQueue.main.async {
          completion(.failure(error))
        }
      }
    }
  }

  func meteoLVObservations(completion: @escaping (Result<[Station]>) -> Void) {
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
  
  func latvianRoadsObservations(completion: @escaping (Result<[LatvianRoadsStation]>) -> Void) {
    let urlString = "https://gispub.lvceli.lv/gispub/rest/services/GISPUB/SIC_CMSPoint/MapServer/0/query"
    var urlComponents = URLComponents(string: urlString)
    
    let outFields = [
      "LVC_CMS.dbo.view_cms_statuss.nosaukums",
      "GIS.DBO.LVC_CMS.Y",
      "GIS.DBO.LVC_CMS.X",
      "LVC_CMS.dbo.view_cms_statuss.CMS_STATUS",
      "GIS.DBO.LVC_CMS.STATION",
      "LVC_CMS.dbo.view_cms_statuss.acid",
      "LVC_CMS.dbo.view_cms_statuss.km"
    ]
    
    urlComponents?.queryItems = [
      URLQueryItem(name: "where", value: "1=1"),
      URLQueryItem(name: "returnGeometry", value: "true"),
      URLQueryItem(name: "outFields", value: outFields.joined(separator: ",")),
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
