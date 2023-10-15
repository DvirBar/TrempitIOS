
import SwiftUI

struct Line: Shape {
    enum LineDirection {
        case vertical, horizontal
    }
    
    let direction: LineDirection
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        if(direction == .horizontal) {
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        } else {
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
        return path
    }
}
