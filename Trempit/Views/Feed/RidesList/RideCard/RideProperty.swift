import SwiftUI

enum PropertyType {
    case success, failure, neutral
}

struct RideProperty: View {
    var icon: Image
    var text: String
    var type: PropertyType
    
//    private let successColor = Color(UIColor(rgb: 0x46BA4D))
    private let failureColor = Color(UIColor(rgb: 0xE31616))
    
    // TODO: Make it less hardcoded
    var backgroundColor: Color {
        switch type {
        case .success:
            return .successBackground2
        case .failure:
            return  .failureBackground2
        case .neutral:
            return .cardBackground2
        }
    }
    
    var iconColor: Color {
        if type == .neutral {
            return Color(UIColor.label)
        }
        
        return .white
    }
    
    var textColor: Color {
        switch type {
        case .success:
            return .successLabel
        case .failure:
            return .failureLabel
        case .neutral:
            return Color(UIColor.label)
        }
    }
    
    var iconWrapperColor: Color {
        switch type {
        case .success:
            return .successLabel
        case .failure:
            return .failureLabel
        case .neutral:
            return  .cardBackground2
        }
    }
    
    @Environment(\.colorScheme) var colorMode

    var backgroundOpacity: Double {
        if colorMode == .dark && type == .neutral {
            return 1
        }
        
        return 0.2
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(backgroundColor)
            VStack(alignment: .center) {
                ZStack {
                    Circle()
                        .fill(iconWrapperColor)
                        .frame(width: 25)
                    icon
                        .font(.system(size: 15))
                        .foregroundStyle(iconColor)
                }
                Spacer()
                Text(text)
                    .foregroundStyle(textColor)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 12))
            }.padding(10)
        }
    }
}

#Preview {
    RideProperty(
        icon: Image(systemName: "clock"),
        text: "היום" + "\n" + "19:30",
        type: .neutral)
        
    .frame(width: 100, height: 100)
}
