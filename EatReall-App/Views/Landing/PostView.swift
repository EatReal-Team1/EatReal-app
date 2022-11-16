//
//  PostView.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI

let placeholder_img = UIImage(named: "image-placeholder")! //placeholder-food"
let placeholder_reaction_img = UIImage(named: "placeholder-reaction")!

struct PostView: View {
  @Binding var post: Post
  let radius: CGFloat = 100
  var offset: CGFloat {
    sqrt(radius * radius / 2)
  }
    var body: some View {
      VStack(alignment: .leading, spacing: 0.0){
        ZStack{
//          Image("placeholder-food")
//          Image(post.food_photo.path)
          Image(uiImage: post.food_photo.image ?? placeholder_img)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(
              width: 370,
              height: 450)
            .overlay(
              Section {
                Image(uiImage: post.selfie_photo.image ?? placeholder_reaction_img)
                  .resizable()
                  .frame(width: 101,
                         height: 101)
                  .foregroundColor(.primary)
                  .padding(8)
                  .background(Color.gray)
                  .clipShape(Circle())
                  .background(
                    Circle()
                      .stroke(Color.black, lineWidth: 2)
                  )
              }.offset(x: -120, y: -180)
            )
        }
        
        Spacer().frame(height: 30)
        
        HStack{
          Image(post.author.profile_picture).resizable()
            .frame(width: 30.0, height: 30.0)
          Text(post.author.display_name)
          Spacer()
        }
        .padding(.horizontal, 12)
        
        Text(post.address)
          .frame(width: .infinity)
          .padding(.horizontal, 12)
        
        Text(post.review_comment)
          .font(.footnote)
          .frame(width: .infinity)
          .padding(.horizontal, 12)
        
        Spacer().frame(height: 40)
      }
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView()
//    }
//}
