import Foundation

/// Observation parameter
public struct Parameter: Codable {

  /// Name
	public let name: String
 
  /// Parameter ID
	public let parameterId: String?
 
  /// Value
	public let value: String?
}
