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
                VStack(alignment: .leading) {
                    Text("נסיעות")
                        .font(.largeTitle.bold())
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack {
                    ForEach(Ride.sampleData) { sampleItem in
                        RideCard(ride: sampleItem)
                            .padding(.bottom)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    RidesList()
}
