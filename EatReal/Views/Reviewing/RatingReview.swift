//
//  RatingReview.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/10/22.
//

import SwiftUI

struct RatingReview: View {
    @Binding var rating: Int
    
    var label = ""
    
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
  
    var body: some View {
      HStack {
        if label.isEmpty == false {
          Text(label)
        }
        
        ForEach(1..<maximumRating + 1, id: \.self) { number in
          image(for: number)
            .resizable()
            .frame(width: 35, height: 35)
            .foregroundColor(number > rating ? offColor : onColor)
            .onTapGesture {
              rating = number
            }
        }
      }.frame(height: 40.0)
    }
    
  
    func image(for number: Int) -> Image {
      if number > rating {
        return offImage ?? onImage
      } else {
        return onImage
      }
    }
}

struct RatingReview_Previews: PreviewProvider {
    static var previews: some View {
        RatingReview(rating: .constant(4))
    }
}
