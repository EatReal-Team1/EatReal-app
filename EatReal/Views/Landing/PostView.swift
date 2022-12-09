//
//  PostView.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI

let placeholder_img = UIImage(named: "image-placeholder")! //"placeholder-food"
let placeholder_reaction_img = UIImage(named: "placeholder-reaction")!
let placeholder_profile_img = UIImage(named: "placeholder-profile-img")!

struct PostView: View {
  @Binding var post: Post
  @EnvironmentObject var viewModel: ViewModel

  let radius: CGFloat = 100
  var offset: CGFloat {
    sqrt(radius * radius / 2)
  }
    var body: some View {
      VStack(alignment: .leading, spacing: 0.0){
        ZStack{
          if (post.selfie_photo == "") {
            AsyncImage(url: post.food_photo)
          } else
          {
            AsyncImage(url: post.food_photo)
              .overlay(
                Section {
                  AsyncImage(url: post.selfie_photo, type: "reaction")
                }.offset(x: -140, y: -200)
              )
          }
        }
        
        Spacer().frame(height: 20)
        
          HStack{
              AsyncImage(url: post.author.profile_picture, type: "profile")
              Text(post.author.display_name)
              Spacer()
              if viewModel.isSaved(postID: post.id){
                  Text("Saved").bold()
                      .font(Font.custom("Helvetica Neue", size: 15.0))
                      .padding(10)
                      .foregroundColor(Color.white)
                      .background(Color.black)
                      .cornerRadius(5)
              } else {
                  Button(action: {
                      viewModel.postsaved(postID: post.id)//userID: viewModel.currentUser.id)
                  })
                  {
                      Text("Save").bold()
                          .font(Font.custom("Helvetica Neue", size: 15.0))
                          .padding(10)
                          .foregroundColor(Color.white)
                          .background(Color.black)
                          .cornerRadius(5)
                      
                  }
              }
          }
        .padding(.horizontal, 12)
        
        Text(post.address)
          .padding(.horizontal, 12)
        
        Text(post.review_comment)
          .font(.footnote)
          .padding(.horizontal, 12)
        
        Spacer().frame(height: 20)
      }
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView())
//    }
//}
