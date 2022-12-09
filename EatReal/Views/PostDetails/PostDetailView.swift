//
//  PostDetailView.swift
//  EatReal
//
//  Created by Emily Feng on 12/8/22.
//

import SwiftUI

struct PostDetailView: View {
  @Binding var post: Post
  @EnvironmentObject var viewModel: ViewModel
  var offImage: Image?
  var onImage = Image(systemName: "star.fill")
  var offColor = Color.gray
  var onColor = Color.yellow
  
  func image(for number: Int) -> Image {
    if Double(number) > post.review_stars {
      return offImage ?? onImage
    } else {
      return onImage
    }
  }
  
  var stars: some View {
    HStack {
      Spacer()
      
      ForEach(1...5, id: \.self) { number in
        image(for: number)
          .resizable()
          .frame(width: 35, height: 35)
          .foregroundColor(number > Int(post.review_stars) ? offColor : onColor)
      }
      Spacer()
    }.frame(height: 40.0)
    
  }
  
  var body: some View {
    ScrollView(){
      VStack(alignment: .leading, spacing: 0.0){
        Spacer()
        
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
              viewModel.updateUser(id: viewModel.currentUser.id)
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
        
        Spacer()
        
        Text("Dishes Reviewed: \(post.review_dish)")
          .padding(.horizontal, 12)
        
        Spacer()
        
        stars
        
      }
    }
  }
}
