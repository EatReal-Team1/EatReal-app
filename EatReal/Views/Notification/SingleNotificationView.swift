//
//  SingleNotificationView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/8/22.
//

import SwiftUI

struct SingleNotificationView: View {
//  @ObservedObject var viewModel: ViewModel// = ViewModel()
  @ObservedObject var viewRouter: ViewRouter
  var viewModel: ViewModel
  @State private var showReviewPage = false
  @Binding var post: Post
  
    var body: some View {
            VStack(spacing: 10.0){
                
              //picture of the post
              AsyncImage(url: post.food_photo, type: "need_review")

                
              //name of the restaurant
              Text(post.review_restaurant).font(.system(size: 25))
                
                // button: add a review
                // need to add an action
                    
              Button(action: {
                self.viewModel.reviewingPost = post
                self.viewRouter.currentPage = .review
              })
              {
                  Text("Add a Review")
                      .bold()
                      .font(Font.custom("Helvetica Neue", size: 25.0))
                      .padding(15)
                      .foregroundColor(Color.white)
                      .background(Color.black)
                      .cornerRadius(5)
              }
              // divider
              Divider().frame(width: 300).background(Color.black).frame(height: 5)

                
            }
    }
}



//struct SingleNotificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleNotificationView()
//    }
//}
