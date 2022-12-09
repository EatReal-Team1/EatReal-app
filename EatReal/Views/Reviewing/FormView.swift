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
  @State private var rating: Int = 0
//  var post: Post
  
  @State private var submitted = false
  var selfie_photo: UIImage
  @EnvironmentObject var viewModel: ViewModel
  @ObservedObject var viewRouter: ViewRouter
  
  func getRestaurant() -> String {
    return self.viewModel.reviewingPost?.review_restaurant ?? "Unknown Place"
  }

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
            self.viewRouter.currentPage = .home
          }){
            Text("X")
              .padding(.horizontal, 30)
              .font(.system(
                size: 25,
                weight: .bold,
                design: .default))
              .foregroundColor(.white)
          }
          
        }
        
        VStack {
          ZStack{
            AsyncImage(url: viewModel.reviewingPost!.food_photo, type: "review")
              .overlay(
                Section {
                  Image(uiImage: selfie_photo)
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

          
          Text(self.getRestaurant())
            .padding(.horizontal, 30)
            .font(.system(
              size: 15,
              weight: .bold,
              design: .default))
            .foregroundColor(.white)
        }
        
        Spacer().frame(height:10)
        
        TextReview(dishes: $dishes, review: $review)
        
        RatingReview(rating: $rating)
        
        Button(action: {
          self.submitted = true
          viewModel.selectedPost?.addReview(selfie_photo: selfie_photo, review_restaurant: restaurant, review_dish: dishes, review_comment: review, review_stars: Double(rating))
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
