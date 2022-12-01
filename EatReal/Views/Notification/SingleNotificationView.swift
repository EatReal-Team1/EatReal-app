//
//  SingleNotificationView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/8/22.
//

import SwiftUI

struct SingleNotificationView: View {
  @ObservedObject var viewModel: ViewModel = ViewModel()
  @State private var showReviewPage = false
  
    var body: some View {


            VStack(spacing: 10.0){
                
                //picture of the post
                    Image("notification").resizable()
                        .frame(width: 300, height: 300).cornerRadius(10)

                
                //name of the restaurant
                Text("Took Took").font(.system(size: 25))
                
                // button: add a review
                // need to add an action

                    
                    Button(action: {
                      showReviewPage = true
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
      NavigationLink("", destination:  AddReview(), isActive: $showReviewPage).navigationBarBackButtonHidden(true)
    }
}



//struct SingleNotificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleNotificationView()
//    }
//}
