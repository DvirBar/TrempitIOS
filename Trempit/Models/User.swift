import Foundation
import SwiftUI

struct User: Decodable {
    let id: UUID
    let profilePic: String?
    let firstName: String
    let lastName: String
    
    static let sampleData: [User] = [
        User(
            id: UUID(),
            profilePic: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fmarvelcinematicuniverse.fandom.com%2Fwiki%2FIron_Man&psig=AOvVaw3B4XkTpdJzjL8mwsSCPWzu&ust=1697385386593000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCOC1grrz9YEDFQAAAAAdAAAAABAE",
            firstName: "טוני",
            lastName: "סטארק"),
        User(
            id: UUID(),
            profilePic: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.thepopverse.com%2Fcaptain-america-marvel-watch-order-movies-movie-mcu-how-to-where-studios-disney-plus&psig=AOvVaw0wmDCICPtLqOlOncaXffpT&ust=1697385481548000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCJjXyOfz9YEDFQAAAAAdAAAAABAE",
            firstName: "סטיב",
            lastName: "רוג׳רס")
    ]
}
