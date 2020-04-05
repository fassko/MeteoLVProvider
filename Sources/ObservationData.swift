import Foundation

/// Observations data
public struct ObservationData: Decodable {

  /// Measure date
  let date: String
  
  /// Measure time
  let time: String
  
  /// Observations from stations
  let stations: [Station]
}
