import Foundation

struct Ride: Identifiable, Decodable {
    let id: UUID
    // TODO: Probably should be another type
    var src: Location
    let stops: [Location]
    var dest: Location
    let driver: User
    var time: Date
    var seats: Int
    var price: Double
    var roomForLuggage: Bool
    let passengers: [User]
    var remarks: String
    
    
    static private let locationSample = Location.sampleData
    
    static let sampleData: [Ride] = [
        Ride(id: UUID(),
             src: locationSample[0],
             stops: [locationSample[1], locationSample[2]],
             dest: locationSample[locationSample.count-1],
             driver: User.sampleData[0],
             time: Date.now,
             seats: 4,
             price: 20,
             roomForLuggage: true,
             passengers: [User.sampleData[1]],
             remarks: "יכול לעצור בכל עיר בדרך. אם יש לכם מזוודה, אשמח שתעדכנו כדי שאדע להיערך בהתאם.")
    ]
}

struct Passenger: Identifiable, Decodable {
    let id: UUID
    let user: User
    let src: Location
    let dest: Location
    let hasLuggage: Bool
    let remarks: String
}


