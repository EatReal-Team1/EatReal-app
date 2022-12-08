  //
  //  PostPreviewView.swift
  //  EatReal
  //
  //  Created by Emily Feng on 12/8/22.
  //
import SwiftUI

struct PostPreviewView: View {
  @StateObject var model = CameraModel()
  @StateObject var viewRouter: ViewRouter
  @State var currentZoomFactor: CGFloat = 1.0
  
  @ObservedObject var notificationManager = LocalNotificationManager()
  
  
  var body: some View {
    VStack{
        //header
      ZStack {
        Color.black
          .ignoresSafeArea()
        
        Text("Posting...")
          .padding(.horizontal, 50)
          .font(.system(
            size: 30,
            weight: .semibold,
            design: .default))
          .foregroundColor(.white)
        
      }.frame(height: 100.0)
      
        // Captured Photo preview
      Group {
        if model.photo != nil {
          Image(uiImage: model.photo.image!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .animation(.spring())
          
        } else {
          RoundedRectangle(cornerRadius: 10)
            .frame(width: 100, height: 100, alignment: .center)
            .foregroundColor(.black)
        }
      }
      
      Button {
        print("Post Button in PostPreview pressed")
        viewRouter.currentPage = .home
        notificationManager.sendNotification(launchIn: 1)
      } label: {
        Text("Post")
          .foregroundColor(Color.white)
      }
    }
  }
}
