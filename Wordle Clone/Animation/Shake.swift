//
//  Shake.swift
//  Wordle Clone
//
//  Created by Ali Erdem Kökcik on 27.10.2022.
//

import SwiftUI

struct Shake: GeometryEffect{
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)), y: 0))
    }
}
