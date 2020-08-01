import Foundation

/// Observation parameter
public struct Parameter: Decodable, Hashable {
  
  enum CodingKeys: String, CodingKey {
    case name
    case parameterId
    case value
  }
  
  /// Name
  public let name: String
  
  /// Parameter ID
  public let parameterId: String?
  
  /// Value
  public let value: String?
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    name = try container.decode(String.self, forKey: .name)
    parameterId = try container.decodeIfPresent(String.self, forKey: .parameterId)
    value = try container.decodeIfPresent(String.self, forKey: .value)?.replacingOccurrences(of: " ", with: "")
  }
}
