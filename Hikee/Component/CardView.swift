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
    var title = "Hiking"
    var subTitle = "Fun and enjoyable outdoor activity for friends and families."
    var onButtonPressed: () {
        print("the button was pressed")
    }
    var imageName: String = "image-1"
    var circleGradientColors: [Color] = [
            Color("ColorIndigoMedium"),
            Color("ColorSalmonLight")
    ]

    
    
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
            topComposition
            imageComposition
        }
    }
}

// MARK: - Top Composition
extension CardView {
    var topComposition: some View {
        VStack(alignment: .leading) {
            headerButtonStack
            subHeader
        }
        .padding(.horizontal, 30)

    }
}

// MARK: - Header And Button Stack
extension CardView {
    // Layout Properties
    var fontSize: CGFloat { 52 }
    
    // Views
    var headerButtonStack: some View {
        HStack {
            header
            button
        }
    }
    
    var header: some View {
        Text(title)
            .fontWeight(.black)
            .font(.system(size: fontSize))
            .foregroundStyle(
                fontGradient
            )
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
    }
    
    var fontGradient: LinearGradient {
        LinearGradient(
            colors: [
                .customGrayLight,
                .customGrayMedium],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    var button: some View {
        Button {
            onButtonPressed
        }label: {
            CustomButtonView()
        }
    }
}

extension CardView {
    var subHeader: some View {
        Text(subTitle)
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            .italic()
            .foregroundColor(.customGrayMedium)
    }
}

// MARK: - Image Composition
extension CardView {
    // Layout properties
    var circleSize: CGFloat { 256 }
    
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
                    colors: circleGradientColors,
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
