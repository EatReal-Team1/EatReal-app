//
//  PostView.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI

struct PostView: View {
    var body: some View {
      VStack(alignment: .leading, spacing: 0.0){
        Image("placeholder-post").resizable()
          .frame(width: 380.0, height: 500.0)
        
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
      }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
