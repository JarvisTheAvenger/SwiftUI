//
//  ContentView.swift
//  Shape
//
//  Created by Rahul on 09/01/22.
//

import SwiftUI

struct Triagnle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        let adjustmentAngle = Angle.degrees(90)
        
        let adjustedStart = startAngle - adjustmentAngle
        let adjustedEnd = endAngle - adjustmentAngle
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: adjustedStart, endAngle: adjustedEnd, clockwise: !clockwise)

        return path
    }
}

struct ContentView: View {
    var body: some View {
//       Triagnle()
//            .stroke(.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
//            .frame(width: 200, height: 200)
        
        Arc(startAngle: .zero, endAngle: .degrees(110), clockwise: true)
            .stroke(.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
