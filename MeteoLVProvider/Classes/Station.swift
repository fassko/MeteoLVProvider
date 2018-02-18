import Foundation

/// Observation station
public struct Station: Codable {

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
}
