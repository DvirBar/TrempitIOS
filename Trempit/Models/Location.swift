import Foundation
import CoreLocation

struct Location: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var latitude: Double
    var longitude: Double
    
    var coordiate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let sampleData: [Location] = [
    Location(id: UUID(), name: "הטכניון - מכון טכנולוגי לישראל",
             latitude: 32.776597, longitude: 35.021624),
    Location(id: UUID(), name: "קניון נוף ים", latitude: 32.441489, longitude: 34.894821),
    Location(id: UUID(), name: "לחם חביתה בנתניה", latitude: 32.278239, longitude: 34.859992),
    Location(id: UUID(), name: "קניון כפר יונה", latitude: 32.321664, longitude: 34.935987)
    ]

    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
