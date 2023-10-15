//
//  RouteStop.swift
//  TrempitIOS
//
//  Created by Dvir Bartov on 15/10/2023.
//

import SwiftUI

struct RouteStop: View {
    var stopName: String
    
    var body: some View {
        HStack {
            Circle()
                .fill(.opacity(0))
                .stroke(Color(UIColor.label), lineWidth: 1.5)
                .frame(width: 10)
            Text(stopName)
            Spacer()
        }
    }
}

#Preview {
    RouteStop(stopName: "שם תחנה")
}
