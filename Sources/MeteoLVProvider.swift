import Foundation

import Combine

public protocol MeteoLVProviderProtocol {
  /// Get observations from Latvian Environment, Geology and Meteorology Centre and Latvian State Roads
  func observations() -> AnyPublisher<[ObservationStation], Error>
}

/// Meteo.lv observations provider
public struct MeteoLVProvider: MeteoLVProviderProtocol {
  
  public init() {}
  
  public func observations() -> AnyPublisher<[ObservationStation], Error> {
    Publishers.CombineLatest(lvgmcObservations(), latvianRoadsObservations())
      .mapError { $0 as Error }
      .map { lvgmcData, lvRoadsData in
        var tmpStationsData = lvgmcData.map {
          ObservationStation.lvgmc($0)
        }
        
        let lvRoadStations = lvRoadsData.map {
          ObservationStation.road($0)
        }
        tmpStationsData.append(contentsOf: lvRoadStations)
        
        return tmpStationsData
      }
      .subscribe(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }

  public func lvgmcObservations() -> AnyPublisher<[LvgmcData], Error> {
    LvgmcProvider().getWeatherDataCombine()
  }
  
  public func latvianRoadsObservations() -> AnyPublisher<[LatvianRoadsStation], Error> {
    let urlString = "https://gispub.lvceli.lv/gispub/rest/services/GISPUB/SIC_CMSPoint/MapServer/0/query"
    var urlComponents = URLComponents(string: urlString)!
    
    let outFields = [
      "LVC_CMS.dbo.view_cms_statuss.nosaukums",
      "GIS.DBO.LVC_CMS.Y",
      "GIS.DBO.LVC_CMS.X",
      "LVC_CMS.dbo.view_cms_statuss.CMS_STATUS",
      "GIS.DBO.LVC_CMS.STATION",
      "LVC_CMS.dbo.view_cms_statuss.acid",
      "LVC_CMS.dbo.view_cms_statuss.km"
    ]
    
    urlComponents.queryItems = [
      URLQueryItem(name: "where", value: "1=1"),
      URLQueryItem(name: "returnGeometry", value: "true"),
      URLQueryItem(name: "outFields", value: outFields.joined(separator: ",")),
      URLQueryItem(name: "outSR", value: "4326"),
      URLQueryItem(name: "returnIdsOnly", value: "false"),
      URLQueryItem(name: "callback", value: ""),
      URLQueryItem(name: "f", value: "json")
    ]
    
    return URLSession.shared
      .dataTaskPublisher(for: urlComponents.url!)
      .map { $0.data }
      .decode(type: LatvianRoadsStationsData.self, decoder: JSONDecoder())
      .mapError { $0 as Error }
      .map { $0.features.filter({ $0.attributes.weather ?? " N/A " != " N/A " }) }
      .subscribe(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}
