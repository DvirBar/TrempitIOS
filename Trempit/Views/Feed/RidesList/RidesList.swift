//
//  RidesList.swift
//  TrempitIOS
//
//  Created by Dvir Bartov on 03/10/2023.
//

import SwiftUI

struct RidesList: View {
    @Environment(\.colorScheme) var colorMode
    
    var background: Color {
        return colorMode == .dark ? Color(UIColor.systemBackground) : Color(UIColor.secondarySystemBackground)
    }
    
    var body: some View {
        ZStack {
            background
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("נסיעות")
                        .font(.largeTitle.bold())
                    
                    RideCard(profilePic: Image("profilePicDemo"))
                }
                .padding()
            }
        }
    }
}

#Preview {
    RidesList()
}
