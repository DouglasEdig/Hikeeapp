//
//  CustomCircleView.swift
//  Hikee
//
//  Created by Douglas Matheus da Silva on 19/06/24.
//

import SwiftUI

struct CustomCircleView: View {
  @State private var isAnimateGradient: Bool = false
  
  var body: some View {
    ZStack {
      
      Circle()
        .fill(
          LinearGradient(
            colors:[
              .customIndigoMedium,
              .customSalmonLight
            ],
            startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
            endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
          )
        )
        .onAppear {
          withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
            isAnimateGradient.toggle()
          }
        }
      MotionAnimationView()
    }//: Zsatck
    .frame(width: 256, height: 256)
  }
}

#Preview {
  CustomCircleView()
}
