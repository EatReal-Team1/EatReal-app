  //
  //  PostPreviewView.swift
  //  EatReal
  //
  //  Created by Emily Feng on 12/8/22.
  //
import SwiftUI

struct PostPreviewView: View {
  @StateObject var model = CameraModel()
  @ObservedObject var viewRouter: ViewRouter
  @State var currentZoomFactor: CGFloat = 1.0
  
  @ObservedObject var notificationManager = LocalNotificationManager()
  
  var headerText: some View {
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
  }
  
  var photoPreviewThumbnil: some View {
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
  }
  
  var postButton: some View {
    Button {
      print("Post Button in PostPreview pressed")
      viewRouter.currentPage = .home
      notificationManager.sendNotification(launchIn: 1)
    } label: {
      Text("Post")
        .font(Font.custom("Helvetica Neue", size: 25.0))
        .padding(15)
        .foregroundColor(Color.white)
        .background(Color.black)
        .cornerRadius(5)
    }
  }
  
  var body: some View {
    VStack{
      headerText
      
      Spacer()
      
      photoPreviewThumbnil
      
      Spacer()
      
      postButton
      
    }
  }
}
