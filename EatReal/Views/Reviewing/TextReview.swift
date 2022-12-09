//
//  TextReview.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/10/22.
//

import SwiftUI

struct TextReview: View {
  @Binding var dishes: String
  @Binding var review: String
  @State private var displayed = false
    var body: some View {
      Text("Dishes:")
        .font(.system(
          size: 25,
          weight: .semibold,
          design: .default))
        .foregroundColor(.white)
      TextField("Dishes", text: $dishes)
        .font(.system(
          size: 25,
          weight: .semibold,
          design: .default))
        .background(.white)
      Text("Describe your experience:")
        .font(.system(
          size: 25,
          weight: .semibold,
          design: .default))
        .foregroundColor(.white)
      TextEditor(text: $review)
        .textFieldStyle(PlainTextFieldStyle())
        .background(Color.black)
        .frame(height: 60)
    }
}

//struct TextReview_Previews: PreviewProvider {
//    static var previews: some View {
//        TextReview()
//    }
//}
