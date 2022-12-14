  //
  //  CameraContentView.swift
  //  EatReal
  //
  //  Created by Emily Feng on 12/8/22.
  //
import SwiftUI
import Combine
import AVFoundation

final class CameraModel: ObservableObject {
  private let service = CameraService()
  
  @Published var photo: Photo!
  
  @Published var showAlertError = false
  
  @Published var isFlashOn = false
  
  @Published var willCapturePhoto = false
  
  var alertError: AlertError!
  
  var session: AVCaptureSession
  
  private var subscriptions = Set<AnyCancellable>()
  
  init() {
    self.session = service.session
    
    service.$photo.sink { [weak self] (photo) in
      guard let pic = photo else { return }
      self?.photo = pic
    }
    .store(in: &self.subscriptions)
    
    service.$shouldShowAlertView.sink { [weak self] (val) in
      self?.alertError = self?.service.alertError
      self?.showAlertError = val
    }
    .store(in: &self.subscriptions)
    
    service.$flashMode.sink { [weak self] (mode) in
      self?.isFlashOn = mode == .on
    }
    .store(in: &self.subscriptions)
    
    service.$willCapturePhoto.sink { [weak self] (val) in
      self?.willCapturePhoto = val
    }
    .store(in: &self.subscriptions)
  }
  
  func configure() {
    service.checkForPermissions()
    service.configure()
  }
  
  func capturePhoto() {
    service.capturePhoto()
  }
  
  func flipCamera() {
    service.changeCamera()
  }
  
  func zoom(with factor: CGFloat) {
    service.set(zoom: factor)
  }
  
  func switchFlash() {
    service.flashMode = service.flashMode == .on ? .off : .on
  }
}

struct CameraView: View {
  @StateObject var model = CameraModel()
  @ObservedObject var viewRouter: ViewRouter
  @EnvironmentObject var viewModel: ViewModel
  @State var currentZoomFactor: CGFloat = 1.0
  @StateObject var notificationManager:LocalNotificationManager
  
  @State var restaurant: String
  
  var captureButton: some View {
    Button(action: {
      model.capturePhoto()
//      viewRouter.currentPage = .postPreview
    }, label: {
      Circle()
        .foregroundColor(.white)
        .frame(width: 80, height: 80, alignment: .center)
        .overlay(
          Circle()
            .stroke(Color.black.opacity(0.8), lineWidth: 2)
            .frame(width: 65, height: 65, alignment: .center)
        )
    })
  }
  
  var capturedPhotoThumbnail: some View {
    Group {
      if model.photo != nil {
        Image(uiImage: model.photo.image!)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 60, height: 60)
          .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
          .animation(.spring())
        
      } else {
        RoundedRectangle(cornerRadius: 10)
          .frame(width: 60, height: 60, alignment: .center)
          .foregroundColor(.black)
      }
    }
  }
  
  var flipCameraButton: some View {
    Button(action: {
      model.flipCamera()
    }, label: {
      Circle()
        .foregroundColor(Color.gray.opacity(0.2))
        .frame(width: 45, height: 45, alignment: .center)
        .overlay(
          Image(systemName: "camera.rotate.fill")
            .foregroundColor(.white))
    })
  }
  
  var cancelButton: some View {
    Button {
      print("Cancel Button in CameraView pressed")
      viewRouter.currentPage = .home
    } label: {
      Text("Cancel")
        .foregroundColor(Color.white)
    }
  }
  
  var headerText: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()
      
      Text("What are you eating?")
        .padding(.horizontal, 50)
        .font(.system(
          size: 30,
          weight: .semibold,
          design: .default))
        .foregroundColor(.white)
      
    }.frame(height: 100.0)
  }
  
  var capturingPhotoView: some View {
    GeometryReader { reader in
      ZStack {
        Color.black.edgesIgnoringSafeArea(.all)
        
        VStack {
          headerText
          
          Button(action: {
            model.switchFlash()
          }, label: {
            Image(systemName: model.isFlashOn ? "bolt.fill" : "bolt.slash.fill")
              .font(.system(size: 20, weight: .medium, design: .default))
          })
          .accentColor(model.isFlashOn ? .yellow : .white)
          
          CameraPreview(session: model.session)
            .gesture(
              DragGesture().onChanged({ (val) in
                  //  Only accept vertical drag
                if abs(val.translation.height) > abs(val.translation.width) {
                    //  Get the percentage of vertical screen space covered by drag
                  let percentage: CGFloat = -(val.translation.height / reader.size.height)
                    //  Calculate new zoom factor
                  let calc = currentZoomFactor + percentage
                    //  Limit zoom factor to a maximum of 5x and a minimum of 1x
                  let zoomFactor: CGFloat = min(max(calc, 1), 5)
                    //  Store the newly calculated zoom factor
                  currentZoomFactor = zoomFactor
                    //  Sets the zoom factor to the capture device session
                  model.zoom(with: zoomFactor)
                }
              })
            )
            .onAppear {
              model.configure()
            }
            .alert(isPresented: $model.showAlertError, content: {
              Alert(title: Text(model.alertError.title), message: Text(model.alertError.message), dismissButton: .default(Text(model.alertError.primaryButtonTitle), action: {
                model.alertError.primaryAction?()
              }))
            })
            .overlay(
              Group {
                if model.willCapturePhoto {
                  Color.black
                }
              }
            )
            .animation(.easeInOut)
          
          
          HStack {
            cancelButton
            Spacer()
            captureButton
            Spacer()
            flipCameraButton
          }
          .padding(.horizontal, 20)
        }
      }
    }
  }
  
  var postingHeaderText: some View {
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
//          .frame(width: 100, height: 100)
          .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
//          .animation(.spring())
        
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
      // MARK: create a post logic
      Task {
        let image: UIImage = model.photo.image!
        print("waiting to finish post")
        await self.viewModel.selectedPost = Post(address: " ", author: self.viewModel.currentUser.toPreviewuser(), food_photo: image, review_restaurant: restaurant)
        self.viewModel.savePost()
      }
      
      viewRouter.currentPage = .home
      self.notificationManager.sendNotification(launchIn: 60*60)
    } label: {
      Text("Post")
        .font(Font.custom("Helvetica Neue", size: 25.0))
        .padding(50)
        .foregroundColor(.white)
    }
  }
  
  var postPreview: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()
      VStack{
        postingHeaderText
        photoPreviewThumbnil
        Spacer().frame()
        Text("Restaurant:")
          .font(.system(
            size: 25,
            weight: .semibold,
            design: .default))
          .foregroundColor(.white)
        TextField("Restaurant", text: $restaurant)
          .font(.system(
            size: 25,
            weight: .semibold,
            design: .default))
          .background(.white)
        postButton
      }
      Spacer()
    }
  }
  
  var body: some View {
    if model.photo != nil {
      postPreview
    } else {
      capturingPhotoView
    }
  }
}
