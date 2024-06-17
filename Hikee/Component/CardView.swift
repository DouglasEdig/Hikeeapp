//
//  CardView.swift
//  Hikee
//
//  Created by Douglas Matheus da Silva on 16/06/24.
//

import SwiftUI

struct CardView: View {
    // Layout properties
    var cardWidth: CGFloat = 320
    var cardHeight: CGFloat = 570
    
    // Main View
    var body: some View {
        
        ZStack {
            CustomBackgroundView()
            cardContent
        }
        .frame(
            width: cardWidth,
            height: cardHeight
        )
    }
}

// MARK: - Card Content
extension CardView {
    var cardContent: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Hiking")
                        .fontWeight(.black)
                        .font(.system(size: 52))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGrayLight,
                                    .customGrayMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                    
                    Spacer()
                    
                    Button {
                        print("the button was pressed")
                    }label: {
                        CustomButtonView()
                    }
                    
                }
                
                Text("Fun and enjoyable outdoor activity for friends and families.")
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .italic()
                    .foregroundColor(.customGrayMedium)
            }
            .padding(.horizontal,30)
            
            imageComposition
        }
    }
}

// MARK: - Image Composition
extension CardView {
    // Layout properties
    var imageName: String { "image-1" }
    var circleSize: CGFloat { 256 }
    var backgroundColors: [Color] {
        [
            Color("ColorIndigoMedium"),
            Color("ColorSalmonLight")
        ]
    }
    
    // Views
    var imageComposition: some View {
        ZStack {
            backgroundCircle
            mainImage
        }
    }
    
    var backgroundCircle: some View {
        Circle()
            .fill(
                LinearGradient(
                    colors: backgroundColors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: circleSize, height: circleSize)
    }
    
    var mainImage: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    CardView()
}
