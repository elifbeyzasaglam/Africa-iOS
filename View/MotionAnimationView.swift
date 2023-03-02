//
//  MotionAnimationView.swift
//  Africa
//
//  Created by ELİF BEYZA SAĞLAM on 10.12.2022.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating : Bool = false
    
    //1.RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in:0...max)
    }
    
    //2.RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    //3.RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    //4.RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    //5.RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                ForEach(0...randomCircle , id:\.self) {item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(),height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale(): 1)
                        .position(
                            x:randomCoordinate(max: geometry.size.width),
                            y:randomCoordinate(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay()),
                            value: UUID() 
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                   
                } //:LOOP
            } //:ZSATCK
            .drawingGroup()
        } // GEOMETY
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
