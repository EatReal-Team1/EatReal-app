//
//  ContentView.swift
//  EatReall-App
//
//  Created by Emily Feng on 11/7/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showCreateProfile = false
    
    var body: some View {
        NavigationView {
          //  NavigationView {
                
                
                
                
                VStack{
                    Logo()
                    //NavigationView {
                    
                    Button(action: {
                        showCreateProfile = true
                    }) {
                        Text("Create Profile").bold()
                            .font(Font.custom("Helvetica Neue", size: 25.0))
                            .padding(15)
                            .foregroundColor(Color.white)
                            .background(Color.black)
                            .cornerRadius(5)
                    }
                    NavigationLink("", destination:  CreateProfileView(), isActive: $showCreateProfile).navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                        .navigationBarTitle("")
                    // .navigationBarItems(leading: backButton, trailing: closeButton)
                    //   .background(Color.white)
                    //.edgesIgnoringSafeArea(.all)
                    
                    
                    PostScroll()
                    navBar()
            //    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
