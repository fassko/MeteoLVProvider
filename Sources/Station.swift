import Foundation

/// Observation station
public struct Station: Decodable {

  /// Id
	let id: String
  
  /// Name
	public let name: String
 
  /// Latitude
	public let latitude: Double
 
  /// Longitude
	public let longitude: Double
 
  /// Icon
	public let icon: String?
 
  /// Icon title
	public let iconTitle: String?
 
  /// Temperature
	public let temperature: String?
 
  /// Parameters
  public let parameters: [Parameter]?
  
  /// Wind
  public var wind: String? {
    guard let windDirectionParameter = parameters?.first(where: { $0.parameterId == "117" }),
      let windDirectionValue = windDirectionParameter.value,
      let windSpeedParameter = parameters?.first(where: { $0.parameterId == "113" }),
      let windSpeedValue = windSpeedParameter.value
    else {
      return nil
    }
    
    return "\(windDirectionValue) \(windSpeedValue)"
  }
}
