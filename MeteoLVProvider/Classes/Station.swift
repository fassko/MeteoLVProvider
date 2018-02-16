import Foundation

/// Observation station
public struct Station: Codable {

  /// Id
	let id: String
  
  /// Name
	let name: String
 
  /// Latitude
	let latitude: Double
 
  /// Longitude
	let longitude: Double
 
  /// Icon
	let icon: String?
 
  /// Icon title
	let iconTitle: String?
 
  /// Temperature
	let temperature: String?
 
  /// Parameters
  let parameters: [Parameter]?
}
