//
//  Diamond.swift
//  SetGame
//
//  Created by Shad Baird on 10/27/23.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let width = rect.width * Const.scaleFactor / 2
        let height = width / 2
        let left = CGPoint(x: center.x - width, y: center.y)
        let right = CGPoint(x: center.x + width, y: center.y)
        let top = CGPoint(x: center.x, y: center.y + height)
        let bottom = CGPoint(x: center.x, y: center.y - height)
        var p = Path()
        p.move(to: top)
        p.addLine(to: right)
        p.addLine(to: bottom)
        p.addLine(to: left)
        p.addLine(to: top)
        return p
    }
    
    private struct Const {
        static let scaleFactor = 0.7
    }
}

#Preview {
    Diamond().stroke(lineWidth: 3.0).fill(.green)
}
