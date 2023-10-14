//
//  RideCard.swift
//  TrempitIOS
//
//  Created by Dvir Bartov on 01/10/2023.
//

import SwiftUI

struct RideCard: View {
    var profilePic: Image
    
    @Environment(\.colorScheme) var colorMode
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(colorMode == .dark ? Color(UIColor.secondarySystemBackground) : Color(UIColor.systemBackground))
                .shadow(radius: 3, x: 0, y: 0)
            VStack(alignment: .leading) {
                HStack {
                        profilePic
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 40, height: 40)
                            .overlay (
                                Circle()
                                    .strokeBorder(Color(UIColor.label), lineWidth: 1)
                            )
                    Text("מידע עליון")
                }
                HStack {
                    Text("מפה")
                }
            }
            .padding()
        }
        .frame(height: 300)
    }
}

#Preview {
    RideCard(
        profilePic: Image("profilePicDemo"))
    
        .padding(20)
}
