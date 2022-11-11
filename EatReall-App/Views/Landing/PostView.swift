//
//  PostView.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI

struct PostView: View {
  let radius: CGFloat = 100
  var offset: CGFloat {
    sqrt(radius * radius / 2)
  }
    var body: some View {
      VStack(alignment: .leading, spacing: 0.0){
        ZStack{
          Image("placeholder-food")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(
              width: 370,
              height: 450)
            .overlay(
              Section {
                Image("placeholder-reaction")
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
          Image("placeholder-profile-img").resizable()
            .frame(width: 30.0, height: 30.0)
          Text("Leanne Sun")
          Spacer()
        }
        .padding(.horizontal, 12)
        
        Text("Dha Rae Oak - Downtown LA")
          .frame(width: .infinity)
          .padding(.horizontal, 12)
        
        Text("The duck was juicy and tender. 100% recommend!")
          .font(.footnote)
          .frame(width: .infinity)
          .padding(.horizontal, 12)
        
        Spacer().frame(height: 40)
      }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
