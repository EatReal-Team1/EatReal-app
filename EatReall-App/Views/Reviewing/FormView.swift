//
//  FormView.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/10/22.
//

import SwiftUI

extension UITextView {
  open override var frame: CGRect {
    didSet {
      backgroundColor = .clear //<<here clear
//      drawsBackground = true
    }
    
  }
}

struct FormView: View {
  @State private var restaurant = ""
  @State private var dishes = ""
  @State private var review = ""
  @State private var displayed = false
  @State private var rating:Int = 0
  
  @State private var submitted = false
  @State private var exit = false
  var body: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()

      
      VStack {
        HStack{
            Text("Add Review")
              .padding(.horizontal, 50)
              .font(.system(
                size: 35,
                weight: .semibold,
                design: .default))
              .foregroundColor(.white)
          
          Spacer()
          
          Button(action: {
            exit = true
          }){
            Text("X")
              .padding(.horizontal, 30)
              .font(.system(
                size: 25,
                weight: .bold,
                design: .default))
              .foregroundColor(.white)
          }
          NavigationLink("", destination:  LandingView(), isActive: $submitted).navigationBarBackButtonHidden(true)
          
          NavigationLink("", destination:  AddReview(), isActive: $exit).navigationBarBackButtonHidden(true)
        }
        
        VStack {
          ZStack{
            Image("placeholder-food")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(
                width: 187,
                height: 220)
              .overlay(
                Section {
                  Image("placeholder-reaction")
                    .resizable()
                    .frame(width: 56,
                           height: 56)
                    .foregroundColor(.primary)
                    .padding(8)
                    .background(Color.gray)
                    .clipShape(Circle())
                    .background(
                      Circle()
                        .stroke(Color.black, lineWidth: 2)
                    )
                }.offset(x: -50, y: -80)
              )
          }
          
          Spacer().frame(height:20)

          
          Text("Providence, RI")
            .padding(.horizontal, 30)
            .font(.system(
              size: 15,
              weight: .bold,
              design: .default))
            .foregroundColor(.white)
        }
        
        Spacer().frame(height:10)
        
        TextReview()
        
        RatingReview(rating: $rating)
        
        Button(action: {
          self.submitted = true
        })  {
          Text("Share")
            .padding(.horizontal, 30)
            .font(.system(
              size: 25,
              weight: .bold,
              design: .default))
            .foregroundColor(.white)
        }
        
      }
    }
    
  }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
