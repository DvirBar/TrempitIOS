import SwiftUI

extension RidesList {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var rides: [Ride] = []
    }
}

