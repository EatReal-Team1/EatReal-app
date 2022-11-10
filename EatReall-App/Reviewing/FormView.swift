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
  @State private var rating:Int = 4
  
  @State private var submitted = false
  var body: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()

      
      VStack {
        HStack{
          NavigationLink(destination: AddReview()) {
            Text("Add Review")
              .padding(.horizontal, 50)
              .font(.system(
                size: 35,
                weight: .semibold,
                design: .default))
              .foregroundColor(.white)
          }.frame(height: 100.0)
          
          Spacer()
          
          Text("X")
            .padding(.horizontal, 30)
            .font(.system(
              size: 35,
              weight: .bold,
              design: .default))
            .foregroundColor(.white)
        }
        
        VStack {
          Image("placeholder-post")
            .resizable()
            .frame(width: 150.0, height: 200.0)
          
          Text("Providence, RI")
            .padding(.horizontal, 30)
            .font(.system(
              size: 15,
              weight: .bold,
              design: .default))
            .foregroundColor(.white)
        }
        
        Spacer()

        
        TextReview()
        
        Spacer()
        
        RatingReview(rating: $rating)
        
        Button(action: {
          self.submitted = true
        })  {
          Text("Share")
            .padding(.horizontal, 30)
            .font(.system(
              size: 35,
              weight: .bold,
              design: .default))
            .foregroundColor(.white)
        }
        
      }
    }
    NavigationLink("", destination:  LandingView(), isActive: $submitted).navigationBarBackButtonHidden(true)
  }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
