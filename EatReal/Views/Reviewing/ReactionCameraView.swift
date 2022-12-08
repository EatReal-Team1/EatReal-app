//
//  ReactionCameraView.swift
//  EatReal
//
//  Created by Emily Feng on 12/8/22.
//

import SwiftUI
import Combine
import AVFoundation

struct ReactionCameraView: View {
  @StateObject var model = CameraModel()
  @State var currentZoomFactor: CGFloat = 1.0
  
  var captureButton: some View {
    Button(action: {
      model.capturePhoto()
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
  
  var cancelButton: some View {
    Button {
      print("Cancel Button in CameraView pressed")
    } label: {
      Text("Cancel")
        .foregroundColor(Color.white)
    }
  }
  
  var headerText: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()
      
      Text("How was your food?")
        .padding(.horizontal, 50)
        .font(.system(
          size: 30,
          weight: .semibold,
          design: .default))
        .foregroundColor(.white)
      
    }.frame(height: 100.0)
  }
  
  var selfieCaptureView: some View {
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
            
            
            
          }
          .padding(.horizontal, 20)
        }
      }
    }
  }
  
  var reviewPostView: some View {
    let selfie: UIImage = model.photo.image!
    return FormView(selfie_photo: selfie)
  }
  
  var body: some View {
    if model.photo != nil {
      reviewPostView
    } else {
      selfieCaptureView
    }
  }
}
