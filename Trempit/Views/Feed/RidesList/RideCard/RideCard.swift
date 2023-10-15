//
//  RideCard.swift
//  TrempitIOS
//
//  Created by Dvir Bartov on 01/10/2023.
//

import SwiftUI

struct RideCard: View {
    var ride: Ride

    @Environment(\.colorScheme) var colorMode
    let textColor = Color(UIColor.label)
    
    let dateFormatter = DateFormatter()
    
    var time: String {
        dateFormatter.dateFormat = "HH:MM"
        return dateFormatter.string(from: ride.time)
    }
    
    var date: String {
        if Calendar.current.isDateInToday(ride.time) {
            return "היום"
        }
        
        dateFormatter.dateFormat = "DD/YY"
        return dateFormatter.string(from: ride.time)
    }
    
    var formattedDate: String {
        date + " " + time
    }
    
    var buttonText: String {
        if ride.isFull {
            return "אין מקומות - הצטרפות לתור"
        }
        
        return "הצטרפות (\(String(ride.availSeats)) מקומות)"
    }
    
    var luggageText: String {
        if ride.roomForLuggage {
            return "יש מקום למטען"
        }
        
        return "אין מקום למטען"
    }
    
    var priceText: String {
        if ride.price == 0 {
            return "חינם"
        }
        
        return "\(ride.price)₪"
    }


    var body: some View {
        ZStack (alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.cardBackground)
                .shadow(radius: 3, x: 0, y: 0)
            VStack(alignment: .leading) {
                HStack {
                    // TODO: Make it a dispatch group: https://stackoverflow.com/questions/42884718/show-activity-indicator-until-all-images-are-load-successfully
                    AsyncImage(url: URL(string: ride.driver.profilePic!)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } else {
                            ProgressView()
                        }
                    }
                    .clipShape(Circle())
                    .frame(width: 25, height: 25)
                    .overlay (
                        Circle()
                            .strokeBorder(Color(UIColor.label), lineWidth: 1)
                    )
                    Text(ride.driver.fullname)
                        .bold()
                        .font(.system(size: 15))
                }
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.cardBackground2)
                        VStack(alignment: .leading, spacing: 0) {
                            RouteStop(stopName: ride.src.name)
                                .font(.system(size: 15))
                            HStack {
                                VStack(spacing: 0) {
                                    Line(direction: .vertical)
                                        .stroke(style: StrokeStyle(lineWidth: 1.5))
                                        .frame(height: 5, alignment: .center)
                                        .padding(.leading, 4.5)
                                    Line(direction: .vertical)
                                        .stroke(style: StrokeStyle(lineWidth: 1.5, dash: [1, 2]))
                                        .frame(height: 8, alignment: .center)
                                        .padding(.leading, 4.5)
                                    Line(direction: .vertical)
                                        .stroke(style: StrokeStyle(lineWidth: 1.5))
                                        .frame(height: 5, alignment: .center)
                                        .padding(.leading, 4.5)
                                }
                                Spacer()
                                Button {
                                    // TODO:
                                } label: {
                                    Image(systemName: "chevron.down.circle.fill")
                                        .renderingMode(.original)
                                }
                            }
                            RouteStop(stopName: ride.dest.name)
                                .font(.system(size: 15))
                        }
                        .padding()
                        
                    }
                }
                HStack {
                    RideProperty(
                        icon: Image(systemName: "clock"),
                        text: formattedDate,
                        type: .neutral)
                    RideProperty(
                        icon: Image(systemName: "dollarsign"),
                        text: priceText,
                        type: .neutral)
                    RideProperty(
                        icon: Image(systemName: "suitcase"),
                        text: luggageText,
                        type: ride.roomForLuggage ? .success : .failure)
                }
                VStack(alignment: .leading) {
                    Text("הערות:")
                        .bold()
                        .font(.system(size: 13))
                    Text(ride.remarks)
                        .font(.system(size: 13))
                }
                .frame(height: 55)
                
                Button {
                    // TODO: Join ride
                } label: {
                    Text(buttonText)
                        .foregroundStyle(ride.isFull ? .black : .white)
                    .frame(maxWidth: .infinity)
                    .padding(5)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                .tint(ride.isFull ? .yellow : .blue)
            }
            .padding()
        }
        .frame(height: 350)
    }
}

#Preview {
    RideCard(ride: Ride.sampleData[0])
        .padding(20)
}
