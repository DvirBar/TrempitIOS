import Foundation
import SwiftUI

struct User: Decodable {
    let id: UUID
    let profilePic: String?
    let firstName: String
    let lastName: String
    
    var fullname: String {
        self.firstName + " " + self.lastName
    }
    
    static let sampleData: [User] = [
        User(
            id: UUID(),
            profilePic: "https://static.wikia.nocookie.net/marvelcinematicuniverse/images/3/35/IronMan-EndgameProfile.jpg",
            firstName: "טוני",
            lastName: "סטארק"),
        User(
            id: UUID(),
            profilePic: "https://assetsio.reedpopcdn.com/Steve-Rogers-Cap.jpg?width=880&quality=80&format=jpg&dpr=2&auto=webp",
            firstName: "סטיב",
            lastName: "רוג׳רס")
    ]
    
}
