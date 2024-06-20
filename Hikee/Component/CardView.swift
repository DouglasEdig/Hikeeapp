//
//  CardView.swift
//  Hikee
//
//  Created by Douglas Matheus da Silva on 16/06/24.
//

import SwiftUI

struct CardView: View {
  //MARK: - Properties
  
  @State private var imageNumber: Int = 1
  @State private var randomNumber: Int = 1
  
  //MARK: - Functions
  func randomImage() {
    repeat {
      randomNumber = Int.random(in: 1...5)
    }while randomNumber == imageNumber
    
    imageNumber = randomNumber
  }
  
  var body: some View {
    //MARK: -Card
    
    ZStack {
      CustomBackgroundView()
      
      VStack {
        
        //MARK: - Header
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
        
        //MARK: - Content(Image)
        ZStack {
          CustomCircleView()
          
          Image("image-\(imageNumber)")
            .resizable()
            .scaledToFit()
            .animation(.easeOut(duration: 1.5), value: imageNumber)
        }
        
        //MARK: - Footer
        Button {
          randomImage()
        }label: {
          Text("Explore More")
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundStyle(
              LinearGradient(
                colors: [
                  .customGreenLight,
                  .customGreenMedium ],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
        }
        .buttonStyle(GradientButton())
        
      }//:Zstack
    }//: Card
    .frame(width: 320, height: 570)
  }
}

#Preview {
  CardView()
}
