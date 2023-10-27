//
//  Oval.swift
//  SetGame
//
//  Created by Shad Baird on 10/27/23.
//

import SwiftUI

struct Oval: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width * ShapeConstants.scaleFactor / 3
        let height = width / 2
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let top = CGPoint(x: center.x, y: center.y + height)
        let bottom = CGPoint(x: center.x, y: center.y - height)
        
        let topLeft = CGPoint(x: center.x - width, y: top.y)
        let centerLeft = CGPoint(x: center.x - width, y: center.y)
        let bottomLeft = CGPoint(x: center.x - width, y: bottom.y)
        let topRight = CGPoint(x: center.x + width, y: top.y)
        let centerRight = CGPoint(x: center.x + width, y: center.y)
        let bottomRight = CGPoint(x: center.x + width, y: bottom.y)
        
        var p = Path()
        p.move(to: topLeft)
        p.addLine(to: topRight)
        p.addArc(center: centerRight, radius: height, startAngle: Angle(degrees: 180-90), endAngle: Angle(degrees: 360-90), clockwise: true)
        p.move(to: bottomRight)
        p.addLine(to: bottomLeft)
        p.addArc(center: centerLeft, radius: height, startAngle: Angle(degrees: 360-90), endAngle: Angle(degrees: 180-90), clockwise: true)
        return p
    }
}

#Preview {
    Oval()
        .stroke()
}
